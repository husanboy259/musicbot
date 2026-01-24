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
