# Fixing Render Deployment - yt-dlp Installation

## Problem
Render deployment fails with: `yt-dlp not found. Please install it: pip install yt-dlp`

## Solution

### Step 1: Verify Build Command in Render Dashboard

1. Go to your Render service dashboard
2. Click on **Settings** tab
3. Scroll to **Build & Deploy** section
4. Make sure **Build Command** is set to:
   ```
   npm install && bash build.sh
   ```
5. Make sure **Start Command** is set to:
   ```
   npm start
   ```

### Step 2: Verify Root Directory

If your code is in the `rvbot` subdirectory:
1. In **Settings** → **Build & Deploy**
2. Set **Root Directory** to: `rvbot`

### Step 3: Manual Deploy

After updating settings:
1. Go to **Manual Deploy** tab
2. Click **Deploy latest commit**
3. Watch the logs to see if `build.sh` runs

### Step 4: Check Build Logs

Look for these messages in the build logs:
```
🔧 Building MusicBot for Render...
📦 Installing yt-dlp...
✅ Downloaded yt-dlp binary with curl
✅ yt-dlp installed successfully
```

If you see errors, check:
- Is Python 3 installed? (Render should have it by default)
- Is curl or wget available? (Render should have curl)
- Are there network issues downloading from GitHub?

### Step 5: Alternative - Use Python Package

If binary download fails, the script will try `pip install yt-dlp`. Make sure Python 3 is available.

## If Still Not Working

1. **Check if build.sh is executable:**
   - The script should be executable, but if not, Render should still run it with `bash build.sh`

2. **Try explicit Python installation:**
   - Update build command to: `npm install && python3 -m pip install yt-dlp && bash build.sh`

3. **Check Render logs for detailed errors:**
   - Look for any error messages during the build phase
   - Share the full build log if issues persist

## Quick Fix Command

If you want to manually test the build script locally (on Linux/Mac):
```bash
cd rvbot
bash build.sh
yt-dlp --version  # Should show version
```
