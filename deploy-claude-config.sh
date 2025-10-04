#!/bin/bash

# Deploy .claude/ configuration to home directory

set -e

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.claude"
TARGET_DIR="$HOME/.claude"
BACKUP_DIR="$HOME/.claude.backup.$(date +%Y%m%d_%H%M%S)"

echo "🚀 Deploying Claude Code configuration..."
echo "   Source: $SOURCE_DIR"
echo "   Target: $TARGET_DIR"
echo ""

# Create backup if target exists
if [ -d "$TARGET_DIR" ]; then
    echo "📦 Creating backup: $BACKUP_DIR"
    cp -r "$TARGET_DIR" "$BACKUP_DIR"
    echo "   ✓ Backup created"
    echo ""
fi

# Deploy managed directories (with delete to keep them clean)
MANAGED_DIRS=("agents" "commands" "output-styles" "hooks" "file-templates")

echo "📂 Syncing managed directories..."
for dir in "${MANAGED_DIRS[@]}"; do
    if [ -d "$SOURCE_DIR/$dir" ]; then
        echo "   • $dir/"
        mkdir -p "$TARGET_DIR/$dir"
        rsync -a --delete "$SOURCE_DIR/$dir/" "$TARGET_DIR/$dir/"
    fi
done

# Copy root-level files (without delete - preserve other files)
echo ""
echo "📄 Copying root configuration files..."
for file in settings.json CLAUDE.md on-agent-complete.wav on-agent-need-attention.wav; do
    if [ -f "$SOURCE_DIR/$file" ]; then
        echo "   • $file"
        cp "$SOURCE_DIR/$file" "$TARGET_DIR/$file"
    fi
done

# Ensure hook scripts are executable
echo ""
echo "🔧 Setting executable permissions on hooks..."
chmod +x "$TARGET_DIR/hooks/"*.sh 2>/dev/null || true

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📍 Configuration deployed to: $TARGET_DIR"
[ -d "$BACKUP_DIR" ] && echo "📍 Backup saved to: $BACKUP_DIR"
