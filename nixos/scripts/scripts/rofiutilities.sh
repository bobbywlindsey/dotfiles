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

menu() {
    CHOICE=$(printf "  Calc=\\n  Emoji" | rofi -dmenu -i -lines 21 -location 1 )
    case "$CHOICE" in 
        **) calc ;;
        **) rofimoji ;;
    esac
}

menu
