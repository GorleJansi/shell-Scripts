read ch

case $ch in
  [a-z])
    echo "Lowercase letter"
    ;;
  [A-Z])
    echo "Uppercase letter"
    ;;
  [0-9])
    echo "Digit"
    ;;
  *)
    echo "Special character"
    ;;
esac
