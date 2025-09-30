#!/bin/bash
# =========================================
# Parallel File Transfer Script (SCP)
# =========================================

servers=("107.21.157.14" "3.85.205.198")   # List of servers
SRC="/Users/jgorle/Downloads/Linux.pdf"   # Local file/folder
USER="ec2-user"  
KEY="/Users/jgorle/Desktop/test.pem"
REMOTE_DIR="/home/$USER/devops"           # Remote destination folder

# Colors
GREEN="\033[0;32m"   # Success
RED="\033[0;31m"     # Failure
PURPLE="\033[0;35m"  # Section headers
NC="\033[0m"         # No Color

# Check if source exists
if [ ! -e "$SRC" ]; then
    echo -e "${RED}❌ Source file/folder $SRC does not exist!${NC}"
    exit 1
fi

echo -e "${PURPLE}🚀 Starting parallel file transfers to ${#servers[@]} servers...${NC}"

# Loop through servers and transfer in parallel
for i in "${servers[@]}"; do
{
    echo -e "${PURPLE}📂 Sending $SRC to $USER@$i:$REMOTE_DIR${NC}"

    # Ensure remote directory exists
    ssh -i "$KEY" "$USER@$i" "mkdir -p $REMOTE_DIR"

    # Copy folder/file
    scp -i "$KEY" -r "$SRC" "$USER@$i:$REMOTE_DIR" &> /tmp/scp_$i.log

    # Check if transfer succeeded
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Transfer to $i complete!${NC}"
    else
        echo -e "${RED}❌ Transfer to $i FAILED! Check /tmp/scp_$i.log for details.${NC}"
    fi
} &
done

wait  # Wait for all parallel transfers to finish
echo -e "${PURPLE}🎉 All transfers completed.${NC}"
