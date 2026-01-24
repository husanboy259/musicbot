# 🚀 Koyeb'da Telegram Music Bot DEPLOY

Bu guide Koyeb'da botni deploy qilish uchun.

## 📋 Talablar

- GitHub repository: https://github.com/husanboy259/musicbot
- Koyeb account (free tier - karta kerak emas!)
- Telegram bot token

## 1️⃣ GitHub Repo Tayyorligi

Repo'da quyidagi fayllar bo'lishi kerak:

- ✅ `bot.js`
- ✅ `package.json`
- ✅ `Dockerfile`

### package.json

```json
{
  "scripts": {
    "start": "node bot.js"
  }
}
```

### bot.js

Bot token env orqali olinishi shart:

```js
const BOT_TOKEN = process.env.BOT_TOKEN;
```

**✅ Bu allaqachon sozlangan!**

## 2️⃣ Dockerfile (Tavsiya etiladi)

Repo root'da `Dockerfile` borligini tekshiring:

```dockerfile
FROM node:20-slim

RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg curl && \
    pip3 install yt-dlp && \
    apt-get clean

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "start"]
```

**✅ Dockerfile allaqachon yaratilgan!**

## 3️⃣ Koyeb'da Service Yaratish

### 3.1 Koyeb Dashboard'ga kiring

1. [https://app.koyeb.com](https://app.koyeb.com) ga kiring
2. **Sign up** yoki **Login** qiling (GitHub orqali ham mumkin)

### 3.2 Create App

1. **Create App** tugmasini bosing
2. **GitHub** tanlang
3. Repo: `husanboy259/musicbot` ni tanlang
4. Branch: `main` tanlang

## 4️⃣ Service Sozlamalari (MUHIM)

### Build & Run

- **Build type**: `Dockerfile` ✅ tanlang
- **Start command**: Bo'sh qoldiring (Dockerfile'da CMD bor)
- **Port**: ❌ **Kerak emas** (bu background worker)

### Instance Type

- **Nano (Free)** tanlang - karta kerak emas!

### Advanced Settings

- **Auto-deploy**: ✅ Yoqib qo'ying (GitHub push qilganda avtomatik deploy)

## 5️⃣ Environment Variables

**Environment Variables** bo'limida qo'shing:

| KEY       | VALUE                    | Izoh                    |
| --------- | ------------------------ | ----------------------- |
| `BOT_TOKEN` | `your_telegram_bot_token` | **SHART** - Bot token   |
| `ADMIN_ID`  | `your_telegram_user_id`   | Ixtiyoriy - Admin ID    |

**Bot token olish:**
- Telegram'da [@BotFather](https://t.me/BotFather) ga yozing
- `/newbot` yuboring va ko'rsatmalarga amal qiling
- Token'ni nusxalang

**Admin ID olish:**
- [@userinfobot](https://t.me/userinfobot) ga yozing
- ID'ni nusxalang

## 6️⃣ Deploy

1. **Deploy** tugmasini bosing
2. 2-3 daqiqada build bo'ladi
3. Log'da quyidagilarni ko'rishingiz kerak:

```
✅ HTTP server listening on 0.0.0.0:3000
Bot is running...
Logged in as @your_bot_name
yt-dlp binary path: /usr/local/bin/yt-dlp
```

## 📜 Log Tekshirish

1. Koyeb Dashboard → **Your App** → **Logs**
2. Real-time loglarni ko'rishingiz mumkin

## 🧪 Test Qilish

1. Telegram'da botingizni toping
2. `/start` yuboring
3. Instagram yoki YouTube link yuboring

## ❗ ENG KO'P UCHRAYDIGAN MUAMMOLAR

### Issue: "BOT_TOKEN undefined"

**Yechim:**
- Koyeb Dashboard → App → **Environment Variables**
- `BOT_TOKEN` qo'shing va to'g'ri token kiriting
- **Redeploy** qiling

### Issue: "ffmpeg not found" yoki "yt-dlp not found"

**Yechim:**
- Dockerfile to'g'ri ishlayaptimi tekshiring
- Log'larda build xatolarini ko'ring
- Dockerfile'da `ffmpeg` va `yt-dlp` o'rnatilganligini tekshiring

### Issue: Port so'rasa yoki "Port required"

**Yechim:**
- Service type **Background Worker** bo'lishi kerak
- Web service emas, **Worker** tanlang
- Port sozlamasini o'chiring

### Issue: Bot ishlamayapti

**Yechim:**
1. `fly logs` yoki Koyeb Dashboard → Logs
2. Xatolarni ko'ring
3. `BOT_TOKEN` to'g'ri qo'shilganligini tekshiring
4. GitHub repo'da `bot.js` va `Dockerfile` borligini tekshiring

## 🎯 Koyeb Afzalliklari

✅ **Karta kerak emas** - free tier
✅ **Telegram botlar uchun mos** - background worker
✅ **yt-dlp ishlaydi** - Dockerfile orqali
✅ **Uxlab qolmaydi** - always-on free tier
✅ **Auto-deploy** - GitHub push qilganda avtomatik deploy

## 🔄 Update Qilish

Kod o'zgarganda:

```bash
git add .
git commit -m "Update bot"
git push
```

Koyeb avtomatik deploy qiladi (agar auto-deploy yoqilgan bo'lsa).

Yoki manual:
- Koyeb Dashboard → App → **Redeploy**

## 📚 Qo'shimcha Ma'lumot

- Koyeb Docs: https://www.koyeb.com/docs
- Koyeb Status: https://status.koyeb.com

## 🆚 Koyeb vs Fly.io vs Render

| Platform | Karta | Free Tier | Bot uchun |
|----------|-------|-----------|-----------|
| **Koyeb** | ❌ Kerak emas | ✅ Always-on | ✅ Mos |
| Fly.io | ✅ Kerak | ✅ Limited | ✅ Mos |
| Render | ❌ Kerak emas | ⚠️ Sleep qiladi | ⚠️ Port kerak |

**Xulosa:** Koyeb Telegram botlar uchun eng qulay - karta kerak emas va uxlab qolmaydi!
