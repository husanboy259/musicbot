#!/bin/bash
set -e

echo "🔧 Building MusicBot for Render..."

# Install yt-dlp if not found
if ! command -v yt-dlp &> /dev/null; then
    echo "📦 Installing yt-dlp..."
    
    # Try pip3 first (most common on Linux)
    if command -v pip3 &> /dev/null; then
        pip3 install --user yt-dlp
        # Add user bin to PATH if pip installs there
        export PATH="$HOME/.local/bin:$PATH"
    # Try pip
    elif command -v pip &> /dev/null; then
        pip install --user yt-dlp
        export PATH="$HOME/.local/bin:$PATH"
    # Try python3 -m pip
    elif command -v python3 &> /dev/null; then
        python3 -m pip install --user yt-dlp
        export PATH="$HOME/.local/bin:$PATH"
    else
        echo "⚠️  Warning: Could not find pip/pip3/python3. yt-dlp may not be available."
        echo "   Install Python and pip, or download yt-dlp binary manually."
    fi
else
    echo "✅ yt-dlp is already installed"
fi

# Verify installation
if command -v yt-dlp &> /dev/null; then
    echo "✅ yt-dlp installed successfully"
    yt-dlp --version
else
    echo "⚠️  Warning: yt-dlp installation may have failed"
    echo "   The bot will try to continue, but downloads may not work."
fi

echo "✅ Build complete!"
