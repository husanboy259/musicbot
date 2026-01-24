# Fly.io Deployment Guide - MusicBot

Bu guide Fly.io'da botni deploy qilish uchun.

## 📋 Talablar

- GitHub repository: https://github.com/husanboy259/musicbot
- Fly.io account (free tier ishlaydi)
- Telegram bot token

## 🐳 1️⃣ Dockerfile Yaratish

Repo root'da `Dockerfile` borligini tekshiring. Agar yo'q bo'lsa, yarating:

```dockerfile
FROM node:20-slim

# yt-dlp va ffmpeg uchun
RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg curl && \
    pip3 install yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "start"]
```

## 🛫 2️⃣ Fly.io Launch

Terminalda repo ichida:

```bash
# Fly.io CLI o'rnatish (agar yo'q bo'lsa)
# Windows: https://fly.io/docs/hands-on/install-flyctl/
# Mac: brew install flyctl
# Linux: curl -L https://fly.io/install.sh | sh

# Login qilish
fly auth login

# Repo ichida
cd rvbot

# Launch
fly launch
```

Savollarga shunaqa javob bering:

- **App name:** `musicbot` (yoki istagan nomingiz)
- **Region:** `fra` (yoki eng yaqin region)
- **Would you like to set up a Postgres database?** `NO`
- **Would you like to deploy now?** `NO` (avval secrets qo'shamiz)

## ⚙️ 3️⃣ fly.toml To'g'ri Sozlash

`fly launch` dan keyin `fly.toml` fayl yaratiladi. Uni to'liq shunaqa qilib qo'ying:

```toml
app = "musicbot"

kill_signal = "SIGINT"
kill_timeout = 5

[build]
  dockerfile = "Dockerfile"

[env]
  NODE_ENV = "production"

[experimental]
  auto_rollback = true
```

**MUHIM:** `[[services]]` bo'lishi SHART EMAS - bu worker, port kerak emas!

## 🔐 4️⃣ BOT_TOKEN Qo'shish

```bash
# Bot token qo'shish
fly secrets set BOT_TOKEN=your_bot_token_here

# Tekshirish
fly secrets list
```

**Bot token olish:**
- Telegram'da [@BotFather](https://t.me/BotFather) ga yozing
- `/newbot` yuboring va ko'rsatmalarga amal qiling
- Token'ni nusxalang

**Admin ID (ixtiyoriy):**
```bash
fly secrets set ADMIN_ID=your_telegram_user_id
```

Admin ID olish: [@userinfobot](https://t.me/userinfobot) ga yozing

## 🚀 5️⃣ Deploy Qilish

```bash
fly deploy
```

## ✅ 6️⃣ Tekshirish

```bash
# Loglarni ko'rish
fly logs

# Status tekshirish
fly status

# SSH orqali kirish (agar kerak bo'lsa)
fly ssh console
```

Loglarda quyidagilarni ko'rishingiz kerak:

```
✅ HTTP server listening on 0.0.0.0:3000
Bot is running...
yt-dlp binary path: /usr/local/bin/yt-dlp
```

## 🧪 7️⃣ Test Qilish

1. Telegram'da botingizni toping
2. `/start` yuboring
3. Instagram yoki YouTube link yuboring

## 🔧 Troubleshooting

### Issue: "BOT_TOKEN not found"
- **Yechim:** `fly secrets set BOT_TOKEN=your_token` qiling
- `fly secrets list` bilan tekshiring

### Issue: "yt-dlp not found"
- **Yechim:** Dockerfile to'g'ri ishlayaptimi tekshiring
- `fly logs` da build loglarini ko'ring

### Issue: Bot ishlamayapti
- **Yechim:** `fly logs` da xatolarni ko'ring
- `fly status` bilan holatni tekshiring

## 📝 Muhim Eslatmalar

- **Free Tier:** 3 shared-cpu-1x machines, 3GB storage
- **Port:** Port kerak emas - bu worker
- **Secrets:** `.env` fayl ishlatilmaydi, `fly secrets` ishlating

## 🔄 Update Qilish

Kod o'zgarganda:

```bash
git add .
git commit -m "Update bot"
git push

# Fly.io avtomatik deploy qiladi (agar auto-deploy yoqilgan bo'lsa)
# Yoki manual:
fly deploy
```

## 📚 Qo'shimcha Ma'lumot

- Fly.io Docs: https://fly.io/docs
- Fly.io Discord: https://fly.io/discord
