#!/bin/bash

# Directly set variables inside the script
THRESHOLD=10  # Minimum free disk space threshold in GB
MOUNT_PATH="/var"  # Path to monitor disk space
SERVER_NAME="My Server"  # Server name
SERVER_IP="192.168.1.1"  # Server IP address
TELEGRAM_API_URL="https://example.com/telegram_bot"  # Telegram bot API URL
TELEGRAM_CHAT_ID="your_chat_id"  # Telegram chat ID
TELEGRAM_TOKEN="your_telegram_token"  # Telegram bot token

# Get available disk space on the specified partition in GB
AVAILABLE_SPACE=$(df -BG "$MOUNT_PATH" | grep -Eo '[0-9]+G' | head -n 1 | sed 's/G//')

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
