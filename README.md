# RVBot - Telegram Instagram & YouTube Video Downloader

A powerful Telegram bot that can download and share videos from Instagram and YouTube with format selection.

*Auto-deployment enabled via GitHub Actions*

## ✨ Features

### Core Features
- **Instagram Video/Image Download** - Download videos and images from Instagram
- **YouTube Video Download** - Download YouTube videos with quality selection
- **Format Selection** - Choose video quality (1080p, 720p, 480p, 360p, Best, Audio)
- **Fallback Format List** - Works even when YouTube blocks format listing
- **Auto-Detection** - Automatically detects Instagram and YouTube links
- **Smart Error Handling** - Retry mechanisms and timeout handling
- **Admin Panel** - View bot statistics and user tracking (admin only)
- **User Tracking** - Tracks new and existing users
- **Automatic Cleanup** - Temporary files are automatically deleted

### Advanced Features
- **YouTube Cookies Support** - Add cookies to bypass YouTube bot detection
- **Timeout & Retry Logic** - Handles network issues gracefully
- **HTTP Server** - Health check endpoint for cloud deployments
- **Multi-Platform Deployment** - Ready for Koyeb, Fly.io, Render, Railway

## 🚀 Quick Start

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Telegram Bot Token (get it from [@BotFather](https://t.me/BotFather))
- `yt-dlp` installed (see Installation section)

### Installation

1. Clone or download this repository:
```bash
git clone https://github.com/rasuljondev/rvbot.git
cd rvbot
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file:
```bash
cp .env.example .env
```

4. Edit `.env` and add your credentials:
```env
BOT_TOKEN=your_telegram_bot_token_here
ADMIN_ID=your_telegram_user_id (optional)
```

5. Install `yt-dlp`:
   - **Windows**: `pip install yt-dlp` or download from [yt-dlp releases](https://github.com/yt-dlp/yt-dlp/releases)
   - **Linux/Mac**: `pip install yt-dlp` or `brew install yt-dlp`

### Running the Bot

```bash
npm start
```

Or:
```bash
node bot.js
```

## 📖 Usage

1. Start a chat with your bot on Telegram
2. Send `/start` command
3. Send an Instagram or YouTube link
4. For YouTube: Select video quality from the format list
5. The bot will download and send you the video

### Example Links

- **Instagram**: `https://www.instagram.com/reel/ABC123/`
- **YouTube**: `https://www.youtube.com/watch?v=ABC123`

## 🎯 Commands

- `/start` - Start the bot and see introduction message
- **📊 Bot Status** (Admin only) - View bot statistics

## ☁️ Deployment

This bot is ready for deployment on multiple platforms:

- **[Koyeb](KOYEB_DEPLOYMENT.md)** - Free tier, no credit card required
- **[Fly.io](FLY_DEPLOYMENT.md)** - Free tier with credit card
- **[Render](RENDER_DEPLOYMENT.md)** - Free tier available
- **[Railway](RAILWAY_DEPLOYMENT.md)** - Easy deployment
- **GitHub Actions** - Auto-deploy to VPS

See individual deployment guides for detailed instructions.

## 🔧 Configuration

### Environment Variables

- `BOT_TOKEN` (required) - Your Telegram bot token from @BotFather
- `ADMIN_ID` (optional) - Your Telegram user ID for admin features
- `PORT` (optional) - HTTP server port (default: 3000)

### YouTube Cookies (Optional but Recommended)

YouTube may block bot requests. To fix this, add YouTube cookies:

1. Install browser extension: [Get cookies.txt LOCALLY](https://chrome.google.com/webstore/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)
2. Go to youtube.com and export cookies
3. Save as `youtube_cookies.txt` in the bot folder

See [YOUTUBE_COOKIES_GUIDE.md](YOUTUBE_COOKIES_GUIDE.md) for detailed instructions.

## 📝 Notes

- The bot can download public Instagram videos and images
- YouTube videos support quality selection
- Video files larger than 50MB cannot be sent (Telegram bot limitation)
- Temporary files are automatically cleaned up after sending
- YouTube cookies are recommended for better reliability

## 🐛 Troubleshooting

### Bot not responding
- Check if your `BOT_TOKEN` is correct in `.env`
- Make sure the bot is running (`npm start`)

### Video download fails
- **Instagram**: Make sure the link is valid and the video is public
- **YouTube**: Add YouTube cookies (see [YOUTUBE_COOKIES_GUIDE.md](YOUTUBE_COOKIES_GUIDE.md))
- Check if `yt-dlp` is installed correctly

### yt-dlp not found
- Install yt-dlp: `pip install yt-dlp`
- On cloud platforms, it's installed automatically via Dockerfile

### YouTube blocking requests
- Export and add YouTube cookies (see [YOUTUBE_COOKIES_GUIDE.md](YOUTUBE_COOKIES_GUIDE.md))
- The bot will show a fallback format list if format listing is blocked

## 📚 Documentation

- [Quick Start Guide](QUICK_START.md)
- [YouTube Cookies Guide](YOUTUBE_COOKIES_GUIDE.md)
- [Koyeb Deployment](KOYEB_DEPLOYMENT.md)
- [Fly.io Deployment](FLY_DEPLOYMENT.md)
- [Render Deployment](RENDER_DEPLOYMENT.md)
- [Railway Deployment](RAILWAY_DEPLOYMENT.md)
- [GitHub Actions Setup](GITHUB_ACTIONS_SETUP.md)

## 🛠️ Technical Details

- **Framework**: Telegraf.js v4.15.0
- **Video Download**: yt-dlp
- **Language**: Node.js
- **Platforms**: Windows, Linux, Mac, Docker

## 📄 License

ISC

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## ⚠️ Disclaimer

This bot is for educational purposes. Make sure you comply with Instagram and YouTube's Terms of Service when using this bot.
