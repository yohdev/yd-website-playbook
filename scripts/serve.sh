#!/bin/bash

# Local development server for testing builds

echo "🚀 Starting local preview server..."

# Build first
bash scripts/build.sh

# Check if Python is available
if command -v python3 &> /dev/null; then
    echo "📡 Starting server at http://localhost:8000"
    cd dist && python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "📡 Starting server at http://localhost:8000"
    cd dist && python -m SimpleHTTPServer 8000
elif command -v npx &> /dev/null; then
    echo "📡 Starting server at http://localhost:8000"
    npx http-server dist -p 8000
else
    echo "❌ No suitable server found. Install Python 3 or Node.js"
    echo "   Or manually serve the ./dist directory"
    exit 1
fi