#!/bin/bash
# Proposal 002: Evaluate session observability skill - Installation Script

set -euo pipefail

echo "Searching for session recording/observability skills"
echo "===================================================="

# Try different skill names that might provide session recording
echo ""
echo "Attempting to find skills for session observability..."

# Option 1: Try buildlog
if npx clawhub@latest install buildlog --force 2>/dev/null; then
    echo "✅ buildlog installed"
    SKILL_NAME="buildlog"
# Option 2: Try session-recorder
elif npx clawhub@latest install session-recorder --force 2>/dev/null; then
    echo "✅ session-recorder installed"
    SKILL_NAME="session-recorder"
# Option 3: Try codex-monitor
elif npx clawhub@latest install codex-monitor --force 2>/dev/null; then
    echo "✅ codex-monitor installed"
    SKILL_NAME="codex-monitor"
else
    echo "⚠️  No session observability skill found on ClawHub"
    echo ""
    echo "Alternative approach:"
    echo "  - Document the gap in available skills"
    echo "  - Consider building a simple session logger"
    echo "  - Or evaluate using OpenClaw's native session history"
    exit 1
fi

SKILL_DIR="$HOME/.openclaw/workspace/skills/$SKILL_NAME"
if [ -d "$SKILL_DIR" ]; then
    echo ""
    echo "✅ Skill installed at: $SKILL_DIR"
    echo ""
    echo "Next steps:"
    echo "  1. Read SKILL.md: cat $SKILL_DIR/SKILL.md"
    echo "  2. Run ./test.sh for validation"
else
    echo "❌ Installation verification failed"
    exit 1
fi
