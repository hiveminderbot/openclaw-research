#!/bin/bash
# Proposal 003: Evaluate OpenClaw Command Center - Installation Script

set -euo pipefail

echo "Installing OpenClaw Command Center for monitoring"
echo "=================================================="

# Install openclaw-command-center skill
echo ""
echo "Installing openclaw-command-center from ClawHub..."
npx clawhub@latest install openclaw-command-center

# Verify installation
SKILL_DIR="$HOME/.openclaw/workspace/skills/openclaw-command-center"
if [ ! -d "$SKILL_DIR" ]; then
    echo "❌ Installation failed: skill not found at $SKILL_DIR"
    exit 1
fi

echo ""
echo "✅ openclaw-command-center installed successfully"
echo ""
echo "Installed at: $SKILL_DIR"
echo ""
echo "Next steps:"
echo "  1. Read the skill documentation: cat $SKILL_DIR/SKILL.md"
echo "  2. Run ./test.sh to validate and test monitoring"
echo "  3. Start monitoring dashboard (see SKILL.md for commands)"
