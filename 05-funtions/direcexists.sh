# !/bin/bash
direc(){
if [[ -d "$1" ]];then
     echo "📂 Directory '$1' already exists"
else
    mkdir -p "$1"
    echo "✅ Directory '$1' created"  
fi    
}
read -p "Enter a dire:" di
direc $di