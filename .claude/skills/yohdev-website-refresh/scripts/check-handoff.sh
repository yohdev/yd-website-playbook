#!/bin/bash

# Check handoff readiness by looking for unfilled placeholders

HANDOFF_DIR="${1:-Sales Handoff}"

if [ ! -d "$HANDOFF_DIR" ]; then
    echo "Error: Handoff directory not found: $HANDOFF_DIR"
    exit 1
fi

echo "Checking handoff readiness in: $HANDOFF_DIR"
echo "================================================"

# Check for required files
required_files=(
    "01-Discovery-Brief.md"
    "02-Brand-Identity.md"
    "03-Logo-and-Colors.md"
    "04-Current-Website.md"
    "05-Target-Audience.md"
    "06-Personas.md"
    "07-Strategy.md"
    "08-Client-Profile.md"
)

missing_files=0
for file in "${required_files[@]}"; do
    if [ ! -f "$HANDOFF_DIR/$file" ]; then
        echo "❌ Missing required file: $file"
        missing_files=$((missing_files + 1))
    fi
done

if [ $missing_files -gt 0 ]; then
    echo ""
    echo "Error: $missing_files required files are missing"
    exit 1
fi

echo "✅ All required files present"
echo ""

# Check for unfilled placeholders
echo "Checking for unfilled placeholders..."
echo "------------------------------------"

placeholder_count=$(grep -r "{{" "$HANDOFF_DIR" --include="*.md" | wc -l | tr -d ' ')

if [ "$placeholder_count" -gt "0" ]; then
    echo "⚠️  Found $placeholder_count unfilled placeholders:"
    echo ""
    
    for file in "${required_files[@]}"; do
        file_placeholders=$(grep "{{" "$HANDOFF_DIR/$file" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$file_placeholders" -gt "0" ]; then
            echo "  $file: $file_placeholders placeholder(s)"
            grep -n "{{" "$HANDOFF_DIR/$file" | sed 's/^/    Line /'
        fi
    done
    
    echo ""
    echo "Options:"
    echo "  (a) Fill placeholders now"
    echo "  (b) Proceed anyway (gaps become Phase 01 questions)"
    echo "  (c) Send package back to sales"
    exit 2
else
    echo "✅ No unfilled placeholders found"
fi

echo ""
echo "Handoff package is ready for processing!"