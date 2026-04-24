#!/bin/bash

# Build script for YohDev Website Refresh
# Creates a deployable dist folder

echo "🔨 Building YohDev Website Refresh..."

# Clean and create dist
rm -rf dist
mkdir -p dist

# Check for client deliverables
if [ -d "output" ] && [ -f "output/Homepage.html" ]; then
    echo "📦 Found client deliverables, building production package..."
    
    # Copy main deliverables
    [ -f "output/Homepage.html" ] && cp "output/Homepage.html" dist/index.html
    [ -f "output/Style Guide.html" ] && cp "output/Style Guide.html" dist/style-guide.html
    [ -f "output/Playbook.html" ] && cp "output/Playbook.html" dist/playbook.html
    
    # Copy theme files
    [ -d "output/theme" ] && cp -r output/theme dist/
    
    # Copy assets
    [ -d "assets" ] && cp -r assets dist/
    [ -d "output/assets" ] && cp -r output/assets dist/
    
    # Copy documentation
    mkdir -p dist/docs
    [ -f "output/README.md" ] && cp output/README.md dist/
    
    echo "✅ Client package built successfully"
    
elif [ -d ".claude/skills/yohdev-website-refresh/reference" ]; then
    echo "📘 Building with reference implementation..."
    
    # Copy reference files from skill
    cp .claude/skills/yohdev-website-refresh/reference/Homepage.html dist/index.html
    cp .claude/skills/yohdev-website-refresh/reference/Style-Guide.html dist/style-guide.html
    cp .claude/skills/yohdev-website-refresh/reference/Playbook.html dist/playbook.html
    
    # Copy uploads if they exist
    [ -d "uploads" ] && cp -r uploads dist/
    
    echo "✅ Reference site built successfully"
    
else
    echo "⚠️  No deliverables found, creating placeholder..."
    
    # Create placeholder index
    cat > dist/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YohDev Website Refresh - No Content</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .container {
            text-align: center;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            backdrop-filter: blur(10px);
            max-width: 600px;
        }
        h1 { font-size: 2.5rem; margin-bottom: 1rem; }
        p { font-size: 1.2rem; opacity: 0.9; margin-bottom: 2rem; }
        .command {
            background: rgba(0, 0, 0, 0.3);
            padding: 1rem;
            border-radius: 0.5rem;
            font-family: monospace;
            margin: 0.5rem 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚧 No Content Yet</h1>
        <p>Run the YohDev Website Refresh skill to generate content:</p>
        <div class="command">npm run skill</div>
        <div class="command">npm run new-client "Client Name"</div>
    </div>
</body>
</html>
EOF
fi

# Always add .nojekyll
touch dist/.nojekyll

# Create simple navigation if multiple files exist
if [ -f "dist/style-guide.html" ] || [ -f "dist/playbook.html" ]; then
    echo "📝 Adding navigation..."
    # This would need to be more sophisticated in production
fi

echo "📁 Build complete in ./dist/"
ls -la dist/