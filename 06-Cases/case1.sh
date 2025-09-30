# !/bin/bash
read -p "enter a number:" num
case $num in
  1)
    echo "You chose One"
    ;;
  2)
    echo "You chose Two"
    ;;
  3)
    echo "You chose Three"
    ;;
  *)
    echo "Invalid choice"
    ;;
esac

        