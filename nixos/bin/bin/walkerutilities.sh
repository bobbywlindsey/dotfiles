calc () {
    input=$(walker --dmenu --placeholder "=") || exit 0
    result=$(echo "$input" | bc)
    result_choice=$(echo "$result" | walker --dmenu --placeholder "Result:")
    
    # If the user selected the result, copy it to the clipboard
    if [[ -n "$result_choice" ]]; then
        echo "$result_choice" | tr -d '[:space:]' | wl-copy
        notify-send "Copied $result_choice to clipboard"
    fi
}

spoofmacaddress () {
    network_interface=$(ip link show | awk -F': ' '/^[0-9]+:/{print $2}' | walker --dmenu --placeholder "Network interface:") || exit 0
    current_mac_address=$(macchanger -s $network_interface | sed -n "s/^Current\s*MAC:\s*\([0-9a-f:]\+\)\s.*$/\1/p")
    notify-send "Old MAC address: $current_mac_address"
    kitty -e bash -c "sudo systemctl start macchanger-$network_interface.service"
    new_mac_address=$(macchanger -s $network_interface | sed -n "s/^Current\s*MAC:\s*\([0-9a-f:]\+\)\s.*$/\1/p")
    notify-send "New MAC address: $new_mac_address"
}

addreminder () {
    minutes=$(walker --dmenu --placeholder "Minutes:") || exit 0
    [[ ! $minutes =~ ^[0-9]+$ ]] && { notify-send "Invalid input" "Enter a number of minutes"; exit 1; }

    message=$(walker --dmenu --placeholder "Message:")

    reminder "$minutes" "$message"
}

remindersmenu () {
    CHOICE=$(printf "󰢌  Add reminder\n󰢌  Show reminders" | walker --dmenu)
    case "$CHOICE" in
        *Add*) addreminder ;;
        *Show*) reminder show ;;
    esac
}

menu() {
    CHOICE=$(printf "  Calc=\\n  Emoji\\n󰐠  Spoof MAC address\\n  Clipboard\\n󰢌  Reminders" | walker --dmenu)
    case "$CHOICE" in 
        **) walker --provider calc ;;
        **) walker --provider symbols ;;
        *󰐠*) spoofmacaddress ;;
        **) walker --provider clipboard ;;
        *󰢌*) remindersmenu ;;
    esac
}

menu
