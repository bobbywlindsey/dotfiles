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
  os.execute(string.format(
    "hyprctl dispatch exec -- kitty -e ~/.config/swayimg/edit_date.sh %q",
    path
  ))
end)
