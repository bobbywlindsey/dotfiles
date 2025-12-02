calc () {
    input=$(rofi -dmenu -i -p "=" -lines 1) || exit 0
    result=$(echo "$input" | bc)
    result_choice=$(echo "$result" | rofi -dmenu -i -p "Result:")
    
    # If the user selected the result, copy it to the clipboard
    if [[ -n "$result_choice" ]]; then
        echo "$result_choice" | tr -d '[:space:]' | wl-copy
        notify-send "Copied $result_choice to clipboard"
    fi
}

spoofmacaddress () {
    network_interface=$(ip link show | awk -F': ' '/^[0-9]+:/{print $2}' | rofi -dmenu -p "Network interface:")
    current_mac_address=$(macchanger -s $network_interface | sed -n "s/^Current\s*MAC:\s*\([0-9a-f:]\+\)\s.*$/\1/p")
    notify-send "Old MAC address: $current_mac_address"
    kitty -e bash -c "sudo systemctl start macchanger-$network_interface.service"
    new_mac_address=$(macchanger -s $network_interface | sed -n "s/^Current\s*MAC:\s*\([0-9a-f:]\+\)\s.*$/\1/p")
    notify-send "New MAC address: $new_mac_address"
}

menu() {
    CHOICE=$(printf "  Calc=\\n  Emoji\\n󰐠  Spoof MAC address" | rofi -dmenu -i -lines 21 -location 1 )
    case "$CHOICE" in 
        **) calc ;;
        **) rofimoji ;;
        *󰐠*) spoofmacaddress ;;
    esac
}

menu
