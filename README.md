# Disk Space Checker

This is a Docker-based tool to monitor disk space and send alerts via Telegram when the available space falls below a specified threshold.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository:
   ```bash
   git clone https://gitlab.com/your-username/disk-space-checker.git
   cd disk-space-checker


2. Create a .env file:
Copy the .env.example file to .env and fill in the required values:

```
cp .env.example .env

```

3. Edit the .env file:
Replace the placeholders with your actual values:

DISK_SPACE_THRESHOLD=10
MOUNT_PATH=/var
SERVER_NAME=My Server
SERVER_IP=192.168.1.1
TELEGRAM_API_URL=https://example.com/telegram_bot
TELEGRAM_CHAT_ID=your_chat_id
TELEGRAM_TOKEN=your_telegram_token

4. Run the container:

```
docker-compose up

```

