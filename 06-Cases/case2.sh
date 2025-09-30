read -p "enter a color:" color
case $color in
    red|green)
        echo "color is red or green"
        ;;
    blue|yellow)
        echo "color is blue or yellow"
        ;;
    *)
        echo "invalid color"
        ;;
    esac        