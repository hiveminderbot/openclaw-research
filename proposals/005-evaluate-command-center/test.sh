#!/bin/bash
# Proposal 003: Evaluate OpenClaw Command Center - Validation Tests

set -euo pipefail

SKILL_DIR="$HOME/.openclaw/workspace/skills/openclaw-command-center"
VALIDATION_FRAMEWORK="$HOME/.openclaw/workspace/skill-validation-framework"

echo "Evaluating OpenClaw Command Center Skill"
echo "========================================="

# Test 1: Installation Verification
echo ""
echo "Test 1: Installation Verification"
echo "-----------------------------------"
if [ -d "$SKILL_DIR" ]; then
    echo "✅ Skill installed at: $SKILL_DIR"
else
    echo "❌ Skill not found at: $SKILL_DIR"
    echo "   Run ./install.sh first"
    exit 1
fi

# Test 2: Documentation
echo ""
echo "Test 2: Documentation Check"
echo "-----------------------------"
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    echo "✅ SKILL.md exists"
    echo ""
    echo "Key features:"
    grep -E "(monitoring|dashboard|cost|tracking)" "$SKILL_DIR/SKILL.md" | head -10 || true
else
    echo "⚠️  SKILL.md not found"
fi

# Test 3: Executable Check
echo ""
echo "Test 3: Command Center Executable"
echo "-----------------------------------"
if [ -f "$SKILL_DIR/index.js" ] || [ -f "$SKILL_DIR/command-center" ] || [ -f "$SKILL_DIR/bin/cc" ]; then
    echo "✅ Command center executable found"
else
    echo "ℹ️  No standalone executable — may use OpenClaw CLI integration"
fi

# Test 4: Try to Get Metrics
echo ""
echo "Test 4: Metrics Collection"
echo "---------------------------"
echo "Attempting to collect system metrics..."

# Check if there's a way to run the command center
if [ -f "$SKILL_DIR/index.js" ]; then
    node "$SKILL_DIR/index.js" --help 2>/dev/null || echo "  ℹ️  Check SKILL.md for usage"
elif [ -f "$SKILL_DIR/command-center" ]; then
    "$SKILL_DIR/command-center" --help 2>/dev/null || echo "  ℹ️  Check SKILL.md for usage"
else
    echo "  ℹ️  Read SKILL.md for correct usage"
fi

# Test 5: Skill Validation Framework Report
echo ""
echo "========================================"
echo "Skill Validation Framework Report"
echo "========================================"

if [ -d "$VALIDATION_FRAMEWORK" ]; then
    cd "$VALIDATION_FRAMEWORK"
    
    echo ""
    echo "Security Scan:"
    uv run skill-validate security "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Security scan failed"
    
    echo ""
    echo "Structure Validation:"
    uv run skill-validate validate "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Validation failed"
    
    echo ""
    echo "Performance Benchmark:"
    uv run skill-validate benchmark "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Benchmark failed"
    
    echo ""
    echo "Full Report:"
    uv run skill-validate report "$SKILL_DIR" --output validation-report-command-center.md 2>/dev/null || echo "⚠️  Report generation failed"
    
    if [ -f "validation-report-command-center.md" ]; then
        echo "✅ Report saved to: validation-report-command-center.md"
    fi
else
    echo "⚠️  skill-validation-framework not found"
fi

echo ""
echo "==========================="
echo "Evaluation Summary"
echo "==========================="
echo ""
echo "Next steps:"
echo "  1. Review validation report above"
echo "  2. Start monitoring dashboard per SKILL.md"
echo "  3. Collect baseline metrics for 24 hours"
echo "  4. Document findings in memory/openclaw-skills-research.md"
