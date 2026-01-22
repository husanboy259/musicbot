#!/bin/bash
set -e

echo "🔧 Building MusicBot for Render..."

# Create bin directory if it doesn't exist
mkdir -p bin
BIN_DIR="$PWD/bin"
export PATH="$BIN_DIR:$PATH"

# Install yt-dlp if not found
if ! command -v yt-dlp &> /dev/null; then
    echo "📦 Installing yt-dlp..."
    
    # Method 1: Try downloading binary directly (works without Python)
    echo "Attempting to download yt-dlp binary..."
    YT_DLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp"
    
    DOWNLOAD_SUCCESS=false
    if command -v curl &> /dev/null; then
        echo "Using curl to download yt-dlp..."
        if curl -L "$YT_DLP_URL" -o "$BIN_DIR/yt-dlp"; then
            chmod +x "$BIN_DIR/yt-dlp"
            DOWNLOAD_SUCCESS=true
            echo "✅ Downloaded yt-dlp binary with curl"
        else
            echo "⚠️  curl download failed"
        fi
    elif command -v wget &> /dev/null; then
        echo "Using wget to download yt-dlp..."
        if wget "$YT_DLP_URL" -O "$BIN_DIR/yt-dlp"; then
            chmod +x "$BIN_DIR/yt-dlp"
            DOWNLOAD_SUCCESS=true
            echo "✅ Downloaded yt-dlp binary with wget"
        else
            echo "⚠️  wget download failed"
        fi
    else
        echo "⚠️  curl and wget not found, will try pip..."
    fi
    
    # Method 2: Try pip installation (if binary download failed)
    if ! command -v yt-dlp &> /dev/null; then
        echo "Trying pip installation..."
        
        # Check if we're in a virtualenv (--user doesn't work in venv)
        if [ -n "$VIRTUAL_ENV" ]; then
            echo "Detected virtualenv, installing without --user flag..."
            USE_USER_FLAG=""
        else
            echo "Not in virtualenv, using --user flag..."
            USE_USER_FLAG="--user"
        fi
        
        if command -v pip3 &> /dev/null; then
            if [ -n "$USE_USER_FLAG" ]; then
                pip3 install --user yt-dlp
                export PATH="$HOME/.local/bin:$PATH"
            else
                pip3 install yt-dlp
            fi
        elif command -v pip &> /dev/null; then
            if [ -n "$USE_USER_FLAG" ]; then
                pip install --user yt-dlp
                export PATH="$HOME/.local/bin:$PATH"
            else
                pip install yt-dlp
            fi
        elif command -v python3 &> /dev/null; then
            if [ -n "$USE_USER_FLAG" ]; then
                python3 -m pip install --user yt-dlp
                export PATH="$HOME/.local/bin:$PATH"
            else
                python3 -m pip install yt-dlp
            fi
        else
            echo "⚠️  Could not find pip/pip3/python3"
        fi
    fi
else
    echo "✅ yt-dlp is already installed"
fi

# Verify installation
if command -v yt-dlp &> /dev/null; then
    echo "✅ yt-dlp installed successfully"
    yt-dlp --version
    echo "yt-dlp location: $(which yt-dlp)"
    echo "✅ Build complete!"
else
    echo "❌ ERROR: yt-dlp installation failed!"
    echo "   Please check Render logs for more details."
    echo "   Attempted methods:"
    echo "   1. Binary download from GitHub"
    echo "   2. pip/pip3 installation"
    exit 1
fi
