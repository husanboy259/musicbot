# Deploying MusicBot on Render.com

This guide will help you deploy your bot on Render.com.

## Prerequisites

1. GitHub repository: https://github.com/husanboy259/musicbot
2. Render.com account (free tier works)
3. Your Telegram bot token

## Step 1: Create a New Service on Render

You have two options:

### Option A: Background Worker (Recommended for Bots)

1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click **New +** → **Background Worker**
3. Connect your GitHub repository: `husanboy259/musicbot`
4. Configure the service:
   - **Name:** `musicbot` (or any name you like)
   - **Region:** Choose closest to you
   - **Branch:** `main`
   - **Root Directory:** `rvbot` (if deploying from subdirectory)
   - **Runtime:** `Node`
   - **Build Command:** `npm install && bash build.sh`
   - **Start Command:** `npm start`
   - **Plan:** Free (or paid if you prefer)

### Option B: Web Service (Also Works)

1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click **New +** → **Web Service**
3. Connect your GitHub repository: `husanboy259/musicbot`
4. Configure the service:
   - **Name:** `musicbot` (or any name you like)
   - **Region:** Choose closest to you
   - **Branch:** `main`
   - **Root Directory:** `rvbot` (if deploying from subdirectory)
   - **Runtime:** `Node`
   - **Build Command:** `npm install && bash build.sh`
   - **Start Command:** `npm start`
   - **Plan:** Free (or paid if you prefer)

**Note:** The bot now includes a simple HTTP server that binds to port 3000 (or PORT env var) for web service compatibility.

## Step 2: Add Environment Variables

In Render dashboard, go to **Environment** tab and add:

### Required:
- **TELEGRAM_BOT_TOKEN** = `your_bot_token_here`
  - Get from [@BotFather](https://t.me/BotFather)

### Optional:
- **ADMIN_ID** = `your_telegram_user_id`
  - Get from [@userinfobot](https://t.me/userinfobot)

## Step 3: Deploy

1. Click **Create Web Service**
2. Render will:
   - Clone your repository
   - Run `npm install`
   - Run `build.sh` to install yt-dlp
   - Start the bot with `npm start`

## Step 4: Verify Deployment

1. Check the **Logs** tab in Render
2. You should see:
   ```
   ✅ yt-dlp installed successfully
   [timestamp] Bot is running...
   ```

3. Test your bot on Telegram:
   - Send `/start` to your bot
   - Try sending an Instagram or YouTube link

## Troubleshooting

### Issue: "yt-dlp not found"
- **Solution:** The build script should install it automatically
- Check that Python 3 is available on Render (it should be by default)
- Check build logs to see if `build.sh` ran successfully

### Issue: Bot exits immediately
- **Solution:** Check environment variables are set correctly
- Verify `TELEGRAM_BOT_TOKEN` is correct
- Check logs for error messages

### Issue: Bot can't send messages
- **Solution:** This might be a network issue
- Render's free tier has some limitations
- Consider upgrading to paid plan for better reliability

## Important Notes

- **Free Tier Limitations:**
  - Service spins down after 15 minutes of inactivity
  - Takes ~30 seconds to wake up
  - 750 hours/month free

- **For Production:**
  - Consider upgrading to paid plan ($7/month)
  - Service stays always-on
  - Better performance

## Alternative: Use a VPS

If Render doesn't work well, consider:
- DigitalOcean Droplet ($5/month)
- AWS EC2 (free tier available)
- Your own VPS server

See `deployment/SETUP.md` for VPS deployment instructions.
