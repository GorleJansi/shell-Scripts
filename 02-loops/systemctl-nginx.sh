#!/bin/bash

# 💻 EC2 servers (Public DNS)
servers=("ec2-107-21-157-14.compute-1.amazonaws.com" "ec2-3-85-205-198.compute-1.amazonaws.com")

# 🔑 Private key path
key="/Users/jgorle/Downloads/test.pem"

# 👤 EC2 username
user="ec2-user"

# 🎨 Colors
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
PURPLE="\033[0;35m"
NC="\033[0m"

# 🔁 Loop through each server
for s in "${servers[@]}"; do
    echo -e "\n🔄 Connecting to $s ..."

    ssh -i "$key" -o ConnectTimeout=5 -o StrictHostKeyChecking=no $user@$s << 'EOF'
        GREEN="\033[0;32m"
        RED="\033[0;31m"
        YELLOW="\033[1;33m"
        PURPLE="\033[0;35m"
        NC="\033[0m"

        echo -e "\n📦 ${PURPLE}--- Installing Nginx ---${NC}"
        if sudo dnf install nginx -y; then                                 # error handling
           echo "✅ Nginx installed successfully"
        else
           echo -e "${RED}❌ Failed to install Nginx${NC}"
           continue
        fi


        echo -e "\n🔧 ${PURPLE}--- Enabling Nginx on Boot ---${NC}"
        sudo systemctl enable nginx || { echo -e "${RED}❌ Failed to enable Nginx${NC}"; exit 1; }

        echo -e "\n🔄 ${PURPLE}--- Restarting Nginx ---${NC}"
        sudo systemctl restart nginx || { echo -e "${RED}❌ Failed to restart Nginx${NC}"; exit 1; }

        echo -e "\n📊 ${PURPLE}--- Nginx Status ---${NC}"
        systemctl status nginx | grep Active || echo -e "${RED}❌ Nginx not active${NC}"

        echo -e "\n🔍 ${PURPLE}--- Checking Port 80 ---${NC}"
        sudo ss -tlnp | grep ':80' || echo -e "${RED}❌ Port 80 not open${NC}"

        echo -e "\n🌐 ${PURPLE}--- Testing Default Nginx Page ---${NC}"
        curl -I http://localhost || echo -e "${RED}❌ Could not reach default page${NC}"

    

EOF

    echo "------------------------"
done
