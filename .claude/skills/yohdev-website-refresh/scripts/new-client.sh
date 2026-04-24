#!/bin/bash

# Create a new client handoff folder from template

CLIENT_NAME="$1"

if [ -z "$CLIENT_NAME" ]; then
    echo "Usage: $0 <client-name>"
    echo "Example: $0 \"Acme Corp\""
    exit 1
fi

# Sanitize client name for folder
CLIENT_SLUG=$(echo "$CLIENT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')
HANDOFF_DIR="Sales Handoff — $CLIENT_NAME"
TEMPLATE_DIR=".claude/skills/yohdev-website-refresh/reference/Sales-Handoff"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Template directory not found: $TEMPLATE_DIR"
    exit 1
fi

if [ -d "$HANDOFF_DIR" ]; then
    echo "Error: Handoff directory already exists: $HANDOFF_DIR"
    exit 1
fi

echo "Creating new client handoff for: $CLIENT_NAME"
echo "Folder: $HANDOFF_DIR"
echo "Slug: $CLIENT_SLUG"
echo ""

# Copy template
cp -r "$TEMPLATE_DIR" "$HANDOFF_DIR"

# Replace {{Client}} placeholders
find "$HANDOFF_DIR" -name "*.md" -type f -exec sed -i '' "s/{{Client}}/$CLIENT_NAME/g" {} \;
find "$HANDOFF_DIR" -name "*.md" -type f -exec sed -i '' "s/{{client-slug}}/$CLIENT_SLUG/g" {} \;

echo "✅ Created handoff folder: $HANDOFF_DIR"
echo ""
echo "Next steps:"
echo "1. Fill in the 8 MD files with client information"
echo "2. Add logo and brand assets to the appropriate locations"
echo "3. Run ./check-handoff.sh \"$HANDOFF_DIR\" to verify readiness"
echo "4. Start Phase 01 with: \"run the YohDev playbook\""