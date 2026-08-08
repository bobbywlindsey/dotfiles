#!/usr/bin/env bash
img="$1"
orig=$(exiftool -DateTimeOriginal -s3 -d "%Y:%m:%d %H:%M:%S" "$img")

if [ -z "$orig" ]; then
  old_date="1970:01:01"
  old_time="00:00:00"
else
  old_date=$(echo "$orig" | cut -d" " -f1)
  old_time=$(echo "$orig" | cut -d" " -f2)
fi

read -e -i "$old_date" -p "New date (YYYY:MM:DD): " new_date
new_datetime="$new_date $old_time"

exiftool -overwrite_original "-DateTimeOriginal=$new_datetime" "-CreateDate=$new_datetime" "$img"
read -p "Press enter to close..."
