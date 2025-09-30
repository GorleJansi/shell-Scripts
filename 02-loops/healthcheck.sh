#!/bin/bash

# 💻 List of EC2 servers (Public DNS recommended)
servers=("ec2-107-21-157-14.compute-1.amazonaws.com" "ec2-3-85-205-198.compute-1.amazonaws.com")

# 🔑 Path to your private key
key="/Users/jgorle/Downloads/test.pem"

# 👤 EC2 username (Amazon Linux = ec2-user, Ubuntu = ubuntu)
user="ec2-user"

# 🎨 Colors
GREEN="\033[0;32m"   # Success
RED="\033[0;31m"     # Failure
YELLOW="\033[1;33m"  # Warning/Error
PURPLE="\033[0;35m"  # Section headers
NC="\033[0m"         # No Color

# 🔁 Loop through each server
for s in "${servers[@]}"; do
    echo -e "\n🔎 Checking $s ..."

    # 💬 Run SSH command to get disk, memory, CPU
    output=$(ssh -i "$key" \
                 -o ConnectTimeout=5 \
                 -o StrictHostKeyChecking=no \
                 $user@$s "
        echo -e '${PURPLE}📂 --- Disk Usage ---${NC}'
        df -h /
        echo -e '${PURPLE}🧠 --- Memory Usage ---${NC}'
        free -h
        echo -e '${PURPLE}⚡ --- CPU Load & Uptime ---${NC}'
        uptime
    " 2>&1)

    # 💡 Capture SSH exit status
    status=$?

    # ✅ If server is reachable
    if [ $status -eq 0 ]; then
        echo -e "${GREEN}✅ $s is UP! Here's the health report:${NC}"
        echo "$output"
    else
        # ❌ If server is unreachable
        echo -e "${RED}❌ $s is DOWN or unreachable.${NC}"
        echo -e "${YELLOW}⚠️ Error:${NC} $output"
    fi

    echo "------------------------"
done
