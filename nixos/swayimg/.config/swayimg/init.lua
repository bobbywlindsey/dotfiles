-- Delete photo you're viewing
swayimg.viewer.on_key("Ctrl-d", function()
  local img = swayimg.viewer.current_image()
  os.remove(img["path"])
  swayimg.imagelist.remove(img["path"])
  swayimg.viewer.open("next")
end)

-- Adjust photo creation date/time metadata
swayimg.viewer.on_key("Ctrl-t", function()
  local img = swayimg.viewer.current_image()
  local path = img["path"]
  os.execute(string.format([[
    foot -e bash -c '
      orig=$(exiftool -DateTimeOriginal -s3 -d "%%Y:%%m:%%d %%H:%%M:%%S" %q)
      old_date=$(echo "$orig" | cut -d" " -f1)
      old_time=$(echo "$orig" | cut -d" " -f2)
      read -e -i "$old_date" -p "New date (YYYY:MM:DD): " new_date
      new_datetime="$new_date $old_time"
      exiftool "-DateTimeOriginal=$new_datetime" "-CreateDate=$new_datetime" %q
      read -p "Press enter to close..."
    '
  ]], path, path))
end)
