# How to Export YouTube Cookies for MusicBot

YouTube is blocking bot requests. To fix this, you need to export cookies from your browser.

## 🚀 Method 1: Browser Extension (Easiest - Recommended)

### Chrome/Edge:

1. **Install Extension:**
   - Chrome: [Get cookies.txt LOCALLY](https://chrome.google.com/webstore/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)
   - Edge: [Get cookies.txt LOCALLY](https://microsoftedge.microsoft.com/addons/detail/get-cookiestxt-locally/pdgbckjfkgjpfhcmebpebdkffjbnjknf)

2. **Export Cookies:**
   - Go to [https://www.youtube.com](https://www.youtube.com) and make sure you're logged in
   - Click the extension icon in your browser toolbar
   - Select **"youtube.com"** from the dropdown
   - Click **"Export"** button
   - Save the file as `youtube_cookies.txt`

3. **Add to Bot:**
   - **Local:** Place `youtube_cookies.txt` in the `rvbot` folder (same folder as `bot.js`)
   - **Koyeb/Render/Fly.io:** Upload via dashboard or use file upload feature
   - **VPS:** Upload to server using SFTP/SCP:
     ```bash
     scp youtube_cookies.txt user@your-server:/path/to/rvbot/
     ```

4. **Restart Bot:**
   - Local: Restart the bot
   - Cloud: Redeploy the service

## 🔧 Method 2: Using yt-dlp Command Line

If you have `yt-dlp` installed locally:

```bash
# Export cookies from Chrome
yt-dlp --cookies-from-browser chrome --cookies youtube_cookies.txt "https://www.youtube.com"

# Or from Firefox
yt-dlp --cookies-from-browser firefox --cookies youtube_cookies.txt "https://www.youtube.com"

# Or from Edge
yt-dlp --cookies-from-browser edge --cookies youtube_cookies.txt "https://www.youtube.com"
```

This will create `youtube_cookies.txt` file. Then upload it to your bot server.

## 📝 Method 3: Manual Export (Advanced)

1. Open browser DevTools (F12)
2. Go to **Application** tab (Chrome) or **Storage** tab (Firefox)
3. Navigate to **Cookies** → `https://www.youtube.com`
4. Export cookies in **Netscape format**
5. Save as `youtube_cookies.txt`

## ☁️ Cloud Deployment (Koyeb/Render/Fly.io)

### Option 1: Add via Environment Variable (if supported)

Some platforms allow file uploads via environment variables or file management.

### Option 2: Include in Docker Build

Add to `Dockerfile`:

```dockerfile
# Copy cookies file if it exists
COPY youtube_cookies.txt* ./
```

Then commit `youtube_cookies.txt` to your repo (⚠️ **NOT RECOMMENDED** - cookies are sensitive!)

### Option 3: Upload After Deployment

1. Deploy your bot
2. Use platform's file management or SSH to upload `youtube_cookies.txt`
3. Restart/redeploy

## ⚠️ Important Notes

- **Cookies Expire:** YouTube cookies expire after some time (usually 1-2 weeks). You'll need to re-export them periodically.
- **Keep Secure:** Cookies contain your YouTube session - don't share them publicly!
- **Git Ignore:** `youtube_cookies.txt` is already in `.gitignore` - don't commit it to GitHub!
- **Privacy:** Cookies allow the bot to access YouTube as if it were you - use responsibly.

## 🧪 Testing

After adding cookies:

1. Restart your bot
2. Send a YouTube link to the bot
3. It should work without "blocking" errors

## 🔄 When to Re-export

Re-export cookies if you see:
- "YouTube is blocking requests" error
- "Sign in to confirm" messages
- Download failures after working previously

## 📚 Troubleshooting

### Issue: "Failed to decrypt with DPAPI"

**Solution:** Use Method 1 (Browser Extension) instead of Method 2. The extension handles cookie decryption automatically.

### Issue: Cookies not working after upload

**Solution:**
1. Make sure file is named exactly `youtube_cookies.txt`
2. Check file is in the same folder as `bot.js`
3. Verify you're logged into YouTube when exporting
4. Try re-exporting cookies

### Issue: Still getting blocked

**Solution:**
1. Make sure you're logged into YouTube when exporting
2. Try exporting from a different browser
3. Clear browser cache and re-export
4. Check if cookies file is valid (should start with `# Netscape HTTP Cookie File`)

## 🆘 Alternative: Direct Download Without Format Selection

If you can't add cookies, the bot will try to download directly without format selection. This may work for some videos but not all.

To use this:
- When you see "YouTube is blocking requests" message
- The bot will automatically try direct download
- If that also fails, you need to add cookies
