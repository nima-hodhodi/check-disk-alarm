#!/bin/bash

# Threshold for available disk space in GB
THRESHOLD=${DISK_SPACE_THRESHOLD:-20}

# MOUNT point for checking
MOUNT_PATH=${MOUNT_PATH:-"/"}

# Get available disk space on the specified partition in GB
AVAILABLE_SPACE=$(df -BG "$MOUNT_PATH" | grep -Eo '[0-9]+G' | head -n 1 | sed 's/G//')

# Server information
SERVER_NAME=${SERVER_NAME:-"My Server"}
SERVER_IP=${SERVER_IP:-"192.168.1.1"}

# Telegram API details
TELEGRAM_API_URL=${TELEGRAM_API_URL:-"https://example.com/telegram_bot"}
TELEGRAM_CHAT_ID=${TELEGRAM_CHAT_ID:-"your_chat_id"}
TELEGRAM_TOKEN=${TELEGRAM_TOKEN:-"your_telegram_token"}

# Check if available space is below the threshold
if (( AVAILABLE_SPACE < THRESHOLD )); then
    # Send a message to Telegram
    curl --location --request POST "$TELEGRAM_API_URL" \
        --header 'Content-Type: application/json' \
        --data "{
            \"id\": \"$TELEGRAM_CHAT_ID\",
            \"message\": \"🚨 Alert: Free disk space is below the threshold.\\n🖥️ Server: $SERVER_NAME\\n🌐 IP: $SERVER_IP\\n📉 Free space: $AVAILABLE_SPACE GB.\\nPlease take necessary actions.\",
            \"token\": \"$TELEGRAM_TOKEN\"
        }"
    echo "Warning sent: Available disk space is low on $SERVER_NAME ($SERVER_IP): $AVAILABLE_SPACE GB"
fi
