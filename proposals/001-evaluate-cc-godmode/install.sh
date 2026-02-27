#!/bin/bash
# Proposal 001: Evaluate cc-godmode - Installation Script

set -euo pipefail

echo "Installing cc-godmode skill for evaluation"
echo "==========================================="

# Check if clawhub CLI is available
if ! command -v clawhub &> /dev/null; then
    echo "Installing clawhub CLI..."
    npm install -g clawhub
fi

# Install cc-godmode skill
echo ""
echo "Installing cc-godmode from ClawHub..."
npx clawhub@latest install cc-godmode

# Verify installation
SKILL_DIR="$HOME/.openclaw/workspace/skills/cc-godmode"
if [ ! -d "$SKILL_DIR" ]; then
    echo "❌ Installation failed: skill not found at $SKILL_DIR"
    exit 1
fi

echo ""
echo "✅ cc-godmode installed successfully"
echo ""
echo "Installed at: $SKILL_DIR"
echo ""
echo "Next steps:"
echo "  1. Read the skill documentation: cat $SKILL_DIR/SKILL.md"
echo "  2. Run ./test.sh to validate and extract patterns"
echo "  3. Document findings in memory/openclaw-skills-research.md"
