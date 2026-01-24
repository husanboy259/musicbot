# Deploying MusicBot on Railway.app

This guide will help you deploy your bot on Railway.app.

## Prerequisites

1. GitHub repository: https://github.com/husanboy259/musicbot
2. Railway.app account (free tier works)
3. Your Telegram bot token

## Step 1: Create a New Project on Railway

1. Go to [Railway Dashboard](https://railway.app)
2. Click **New Project**
3. Select **Deploy from GitHub repo**
4. Choose your repository: `husanboy259/musicbot`
5. Railway will automatically detect it's a Node.js project

**Note:** The bot includes a simple HTTP server that binds to a port (required for Railway web services). Railway will automatically assign a port via the `PORT` environment variable.

## Step 2: Configure the Service

1. Click on your service
2. Go to **Settings** tab
3. Configure:

### Build Settings:
- **Root Directory:** `rvbot` (if your code is in a subdirectory)
- **Build Command:** `npm install && bash build.sh`
- Railway will use the `railway.json` config if present

### Start Command:
- **Start Command:** `npm start`

## Step 3: Add Environment Variables

1. Go to **Variables** tab
2. Add the following environment variables:

### Required:
- **TELEGRAM_BOT_TOKEN** = `your_bot_token_here`
  - Get from [@BotFather](https://t.me/BotFather)

### Optional:
- **ADMIN_ID** = `your_telegram_user_id`
  - Get from [@userinfobot](https://t.me/userinfobot)

## Step 4: Deploy

1. Railway will automatically deploy when you connect the repo
2. Or click **Deploy** to trigger a manual deploy
3. Watch the **Deployments** tab for build progress

## Step 5: Verify Deployment

1. Check the **Logs** tab
2. You should see:
   ```
   🔧 Building MusicBot for Render...
   📦 Installing yt-dlp...
   ✅ yt-dlp installed successfully
   [timestamp] Bot is running...
   ```

3. Test your bot on Telegram:
   - Send `/start` to your bot
   - Try sending an Instagram or YouTube link

## Troubleshooting

### Issue: "yt-dlp not found"
- **Solution:** The build script should install it automatically
- Check build logs to see if `build.sh` ran successfully
- Railway uses Nixpacks which should have Python available

### Issue: Bot exits immediately
- **Solution:** Check environment variables are set correctly
- Verify `TELEGRAM_BOT_TOKEN` is correct
- Check logs for error messages

### Issue: Build fails
- **Solution:** Check that `build.sh` is executable
- Verify Python 3 is available (Railway should have it)
- Check build logs for specific errors

## Railway vs Render

### Advantages of Railway:
- ✅ More generous free tier
- ✅ Better documentation
- ✅ Easier to use
- ✅ Automatic HTTPS
- ✅ Better logging interface

### Free Tier Limits:
- $5 credit per month
- Service may sleep after inactivity (paid plans keep it always-on)

## Important Notes

- **Root Directory:** If your code is in `rvbot` subdirectory, make sure to set it in Railway settings
- **Build Script:** The `build.sh` script will install yt-dlp via pip in the virtualenv
- **Environment Variables:** Make sure to add them in Railway dashboard, not in `.env` file (`.env` files are not used in production)

## Alternative: Use Railway CLI

You can also deploy using Railway CLI:

```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Initialize project
railway init

# Link to existing project
railway link

# Set environment variables
railway variables set TELEGRAM_BOT_TOKEN=your_token
railway variables set ADMIN_ID=your_id

# Deploy
railway up
```

## Need Help?

- Railway Docs: https://docs.railway.app
- Railway Discord: https://discord.gg/railway
