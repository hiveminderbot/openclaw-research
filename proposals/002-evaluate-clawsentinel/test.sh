#!/bin/bash
# Proposal 002: Evaluate ClawSentinel - Validation Tests

set -euo pipefail

SKILL_DIR="$HOME/.openclaw/workspace/skills/clawsentinel"
VALIDATION_FRAMEWORK="$HOME/.openclaw/workspace/skill-validation-framework"
SKILLS_DIR="$HOME/.openclaw/workspace/skills"

echo "Evaluating ClawSentinel Skill"
echo "==============================="

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
    grep -A 5 "^## Description" "$SKILL_DIR/SKILL.md" 2>/dev/null || true
else
    echo "⚠️  SKILL.md not found"
fi

# Test 3: ClawSentinel Self-Scan
echo ""
echo "Test 3: ClawSentinel Self-Scan"
echo "--------------------------------"
if [ -f "$SKILL_DIR/clawsentinel" ] || [ -f "$SKILL_DIR/bin/clawsentinel" ] || [ -f "$SKILL_DIR/index.js" ]; then
    echo "✅ ClawSentinel executable found"
    # Try to run self-scan
    cd "$SKILL_DIR" && ./clawsentinel . 2>/dev/null || \
    node index.js . 2>/dev/null || \
    echo "⚠️  Could not run self-scan (check SKILL.md for usage)"
else
    echo "ℹ️  No standalone executable — may be documentation-only skill"
fi

# Test 4: Scan Installed Skills
echo ""
echo "Test 4: Security Audit of Installed Skills"
echo "--------------------------------------------"
echo "Scanning all skills in: $SKILLS_DIR"
echo ""

for skill_path in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_path")
    echo "Scanning: $skill_name"
    
    # Try to run clawsentinel on each skill
    if [ -f "$SKILL_DIR/clawsentinel" ]; then
        "$SKILL_DIR/clawsentinel" "$skill_path" 2>/dev/null || echo "  ⚠️  Scan failed for $skill_name"
    elif [ -f "$SKILL_DIR/index.js" ]; then
        node "$SKILL_DIR/index.js" "$skill_path" 2>/dev/null || echo "  ⚠️  Scan failed for $skill_name"
    else
        echo "  ℹ️  Cannot scan — check SKILL.md for correct usage"
        break
    fi
done

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
    echo "Full Report:"
    uv run skill-validate report "$SKILL_DIR" --output validation-report-clawsentinel.md 2>/dev/null || echo "⚠️  Report generation failed"
    
    if [ -f "validation-report-clawsentinel.md" ]; then
        echo "✅ Report saved to: validation-report-clawsentinel.md"
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
echo "  1. Review scan results above"
echo "  2. Document findings in memory/openclaw-skills-research.md"
echo "  3. Decide: integrate into CI workflow?"
