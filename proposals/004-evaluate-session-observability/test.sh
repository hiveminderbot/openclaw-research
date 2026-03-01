#!/bin/bash
# Proposal 002: Evaluate session observability - Validation Tests

set -euo pipefail

echo "Testing Session Observability Skill"
echo "===================================="

# Find which skill was installed
SKILL_DIR=""
for skill in buildlog session-recorder codex-monitor; do
    if [ -d "$HOME/.openclaw/workspace/skills/$skill" ]; then
        SKILL_DIR="$HOME/.openclaw/workspace/skills/$skill"
        SKILL_NAME="$skill"
        break
    fi
done

if [ -z "$SKILL_DIR" ]; then
    echo "⚠️  No session observability skill found"
    echo "Testing with OpenClaw native session history instead..."
    
    # Test native session capabilities
    echo ""
    echo "Native Session Test:"
    echo "-------------------"
    
    # Check if we can access session history
    if [ -d "$HOME/.openclaw/agents/main/sessions" ]; then
        SESSION_COUNT=$(ls "$HOME/.openclaw/agents/main/sessions" | wc -l)
        echo "✅ Found $SESSION_COUNT sessions in history"
    else
        echo "ℹ️  No session directory found"
    fi
    
    echo ""
    echo "Recommendation:"
    echo "  Since no dedicated session observability skill exists,"
    echo "  document how to use OpenClaw's native session history"
    echo "  for debugging agent workflows."
    
    exit 0
fi

echo "Found skill: $SKILL_NAME"
echo "Location: $SKILL_DIR"

# Run validation
echo ""
echo "Running skill validation..."
cd "$HOME/.openclaw/workspace/skill-validation-framework"

# Security Scan
echo ""
echo "Security Scan:"
uv run skill-validate security "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Security scan failed"

# Structure Validation
echo ""
echo "Structure Validation:"
uv run skill-validate validate "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Validation failed"

# Performance Benchmark
echo ""
echo "Performance Benchmark:"
uv run skill-validate benchmark "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Benchmark failed"

# Full Report
echo ""
echo "Generating Full Report..."
uv run skill-validate report "$SKILL_DIR" --output validation-report-$SKILL_NAME.md 2>/dev/null || echo "⚠️  Report generation failed"

echo ""
echo "================================"
echo "Validation Complete"
echo "================================"
