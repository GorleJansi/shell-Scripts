# !/bin/bash
check(){
    if [ -f $1 ];then
       echo "$1 file exists..!"
    else
       echo "$1 file doesnt exists..!"  
    fi    
}
read -p "enter a file:" f
check $f