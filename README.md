# Features
Monitors disk space on a specified path.

Sends alerts via Telegram when free space is below the threshold.

Easy to configure with hardcoded variables.

Lightweight and standalone (no external dependencies except curl).

# Prerequisites
Before using the script, ensure the following are installed on your system:

Bash: The script is written in Bash, so it requires a Bash shell.

curl: Used to send alerts via Telegram. Install it using your package manager:

On Debian/Ubuntu: sudo apt install curl

On CentOS/RHEL: sudo yum install curl

# Download the Script
Clone this repository or download the script directly:
```
git clone https://gitlab.com/nima-hodhodi/disk-space-checker.git
cd disk-space-checker
```
Alternatively, download the script using curl:
```
curl -O https://gitlab.com/nima-hodhodi/disk-space-checker/raw/main/disk_space_check.sh
chmod +x disk_space_check.sh
```
# Configure the Script
The script uses hardcoded variables for configuration. Open the script in a text editor and modify the following variables as needed:

# Open the script in a text editor
```
nano disk_space_check.sh
```
# Variables to Configure:
```
THRESHOLD=10: The minimum free disk space threshold in GB. If the available space is below this value, an alert will be sent.

MOUNT_PATH="/var": The path to monitor for disk space (e.g., /var, /home, or /).

SERVER_NAME="My Server": The name of the server (used in the alert message).

SERVER_IP="192.168.1.1": The IP address of the server (used in the alert message).

TELEGRAM_API_URL="https://example.com/telegram_bot": The URL of the Telegram bot API.

TELEGRAM_CHAT_ID="your_chat_id": The chat ID where the alert will be sent.

TELEGRAM_TOKEN="your_telegram_token": The token for the Telegram bot.
```
# Run the Script
After configuring the script, you can run it manually:
```
bash disk_space_check.sh
```
Expected Output:
If the available disk space is below the threshold, the script will send a Telegram alert and print a warning message:

Warning sent: Available disk space is low on My Server (192.168.1.1): 5 GB
If the disk space is above the threshold, the script will do nothing.

# Schedule the Script with Cron
To automate the script and run it periodically (e.g., every hour), you can use cron.

Open the crontab editor:
```
crontab -e
```
Add the following line to run the script every hour:
```
0 * * * * /path/to/disk_space_check.sh
```
Replace /path/to/disk_space_check.sh with the full path to the script.

Save and exit the editor. The script will now run automatically at the specified interval.

Troubleshooting
1. Script Doesn't Run
Ensure the script has execute permissions:
```
chmod +x disk_space_check.sh
```
Check if curl is installed:
```
curl --version
```
2. Telegram Alert Not Sent

Verify that the TELEGRAM_API_URL, TELEGRAM_CHAT_ID, and TELEGRAM_TOKEN are correct.

Test the Telegram API URL and token using a simple curl command:
```
curl -X POST -H "Content-Type: application/json" -d '{"id": "your_chat_id", "message": "Test message", "token": "your_telegram_token"}' https://example.com/telegram_bot
```
3. Incorrect Disk Space Calculation
Ensure the MOUNT_PATH variable points to a valid mount point.

Check the available disk space manually:
```
df -BG /
```
