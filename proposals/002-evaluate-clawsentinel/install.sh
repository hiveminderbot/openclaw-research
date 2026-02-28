#!/bin/bash
# Proposal 002: Evaluate ClawSentinel - Installation Script

set -euo pipefail

echo "Installing ClawSentinel for security auditing"
echo "=============================================="

# Install clawsentinel skill
echo ""
echo "Installing clawsentinel from ClawHub..."
npx clawhub@latest install clawsentinel

# Verify installation
SKILL_DIR="$HOME/.openclaw/workspace/skills/clawsentinel"
if [ ! -d "$SKILL_DIR" ]; then
    echo "❌ Installation failed: skill not found at $SKILL_DIR"
    exit 1
fi

echo ""
echo "✅ clawsentinel installed successfully"
echo ""
echo "Installed at: $SKILL_DIR"
echo ""
echo "Next steps:"
echo "  1. Read the skill documentation: cat $SKILL_DIR/SKILL.md"
echo "  2. Run ./test.sh to validate and scan installed skills"
echo "  3. Document findings in memory/openclaw-skills-research.md"
