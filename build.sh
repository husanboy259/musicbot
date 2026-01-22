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
    
    # On Render, prioritize pip installation (works better with virtualenv)
    # Check if we're in a virtualenv (Render uses this)
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "Detected virtualenv (Render), using pip installation..."
        if command -v pip3 &> /dev/null; then
            pip3 install yt-dlp
        elif command -v pip &> /dev/null; then
            pip install yt-dlp
        elif command -v python3 &> /dev/null; then
            python3 -m pip install yt-dlp
        else
            echo "⚠️  Could not find pip/pip3/python3, trying binary download..."
        fi
    else
        # Not in virtualenv, try pip with --user first
        echo "Not in virtualenv, trying pip installation..."
        if command -v pip3 &> /dev/null; then
            pip3 install --user yt-dlp && export PATH="$HOME/.local/bin:$PATH"
        elif command -v pip &> /dev/null; then
            pip install --user yt-dlp && export PATH="$HOME/.local/bin:$PATH"
        elif command -v python3 &> /dev/null; then
            python3 -m pip install --user yt-dlp && export PATH="$HOME/.local/bin:$PATH"
        fi
    fi
    
    # Fallback: Try downloading binary directly (if pip failed)
    if ! command -v yt-dlp &> /dev/null; then
        echo "pip installation not available or failed, trying binary download..."
        YT_DLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp"
        
        if command -v curl &> /dev/null; then
            echo "Using curl to download yt-dlp binary..."
            if curl -L "$YT_DLP_URL" -o "$BIN_DIR/yt-dlp"; then
                chmod +x "$BIN_DIR/yt-dlp"
                echo "✅ Downloaded yt-dlp binary with curl"
            else
                echo "⚠️  curl download failed"
            fi
        elif command -v wget &> /dev/null; then
            echo "Using wget to download yt-dlp binary..."
            if wget "$YT_DLP_URL" -O "$BIN_DIR/yt-dlp"; then
                chmod +x "$BIN_DIR/yt-dlp"
                echo "✅ Downloaded yt-dlp binary with wget"
            else
                echo "⚠️  wget download failed"
            fi
        else
            echo "⚠️  curl and wget not found"
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
