#!/usr/bin/env bash

play_song() {
    file=$(fd .opus ~/Music -p -t f | sort | sed "s|^/home/bobby/Music/||" | rofi -dmenu -i -p "Select song:" -lines 1) || exit 0

    mpc insert "$file" && mpc next >/dev/null && mpc play >/dev/null
}

add_current_song_to_playlist() {
    # Get the currently playing song
    current_song=$(mpc current)

    # Check if a song is playing
    if [ -z "$current_song" ]; then
        notify-send "No song is currently playing."
        exit 1
    fi

    # Choose a playlist
    playlist=$(mpc lsplaylist | rofi -dmenu -i -p "Select playlist:" -lines 5)

    # Check if a playlist was selected
    if [ -z "$playlist" ]; then
        notify-send "No playlist selected."
        exit 1
    fi

    # Add current song to the selected playlist if it's not already there
    mpc playlist "$playlist" | grep -q "$current_song" || mpc addplaylist "$playlist" "$current_song".opus 

    # Notify the user
    notify-send "Added $current_song to $playlist"
}

rmexif () {
    # Limit depth of search to 3; only search png, jpg, jpeg, and pdf file types
    file=$(fd -e png -e jpeg -e jpg -e pdf -i -d 3 . $HOME | rofi -dmenu -i -p "Select a file:")
    notify-send "$file" 
    exiftool -all= $file
    notify-send "Exif data removed on $file" 
}

extractytaudio () {
    url=$(rofi -dmenu -p "YouTube URL:")
    notify-send "Extracting audio..." 
    yt-dlp -i --extract-audio --audio-format opus --audio-quality 0 --xattrs --add-metadata -o '~/Downloads/%(artist)s - %(track)s.%(ext)s' $url
    notify-send "Audio extracted" 
}

menu() {
    CHOICE=$(printf "󰝚  Play song\\n󰲸  Add to playlist\\n󰒜  Remove exif\\n  Extract YT audio" | rofi -dmenu -i -lines 21 -location 1 )
    case "$CHOICE" in 
        *󰝚*) play_song ;;
        *󰲸*) add_current_song_to_playlist ;;
        *󰒜*) rmexif ;;
        **) extractytaudio ;;
    esac
}

menu
