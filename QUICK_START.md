# Quick Start Guide - How to Run RVBot

## Step 1: Install Dependencies ✅
Dependencies are already installed! If you need to reinstall:
```bash
npm install
```

## Step 2: Create .env File

1. Copy the example file:
   ```bash
   copy .env.example .env
   ```
   (On Linux/Mac: `cp .env.example .env`)

2. Edit the `.env` file and add your credentials:
   - **TELEGRAM_BOT_TOKEN**: Get this from [@BotFather](https://t.me/BotFather) on Telegram
     - Start a chat with @BotFather
     - Send `/newbot` and follow the instructions
     - Copy the token you receive
   - **ADMIN_ID** (optional): Your Telegram user ID
     - Get it by messaging [@userinfobot](https://t.me/userinfobot) on Telegram
     - It will reply with your user ID

## Step 3: Install yt-dlp

The bot requires `yt-dlp` to download videos. Install it:

**Windows:**
```bash
pip install yt-dlp
```

Or download from: https://github.com/yt-dlp/yt-dlp/releases

**Linux/Mac:**
```bash
pip install yt-dlp
# or
brew install yt-dlp
```

## Step 4: Run the Bot

```bash
npm start
```

Or:
```bash
node bot.js
```

## Step 5: Test the Bot

1. Open Telegram and search for your bot (the username you set with @BotFather)
2. Send `/start` to your bot
3. Send an Instagram or YouTube link to test

## Troubleshooting

- **"yt-dlp not found"**: Make sure yt-dlp is installed (see Step 3)
- **"Bot not responding"**: Check that your TELEGRAM_BOT_TOKEN is correct in `.env`
- **"Invalid token"**: Make sure there are no extra spaces in your `.env` file

## What the Bot Does

- Downloads Instagram videos and images
- Downloads YouTube videos (with quality selection)
- Tracks user statistics (admin only)
- Automatically cleans up temporary files

Enjoy your bot! 🚀
