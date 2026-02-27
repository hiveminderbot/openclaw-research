#!/bin/bash
# Proposal 001: Evaluate cc-godmode - Validation Tests
# Extracts and validates multi-agent orchestration patterns

set -euo pipefail

SKILL_DIR="$HOME/.openclaw/workspace/skills/cc-godmode"
RESEARCH_FILE="$HOME/.openclaw/workspace/memory/openclaw-skills-research.md"
VALIDATION_FRAMEWORK="$HOME/.openclaw/workspace/skill-validation-framework"

echo "Evaluating cc-godmode Skill"
echo "==========================="

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

# Test 2: Documentation Exists
echo ""
echo "Test 2: Documentation Check"
echo "-----------------------------"
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    echo "✅ SKILL.md exists"
    echo ""
    echo "Skill description:"
    grep -A 5 "^## Description" "$SKILL_DIR/SKILL.md" 2>/dev/null || \
    grep -A 5 "^# " "$SKILL_DIR/SKILL.md" | head -10 || \
    echo "    (No description found)"
else
    echo "⚠️  SKILL.md not found — checking for README..."
    if [ -f "$SKILL_DIR/README.md" ]; then
        echo "✅ README.md exists"
    else
        echo "❌ No documentation found"
    fi
fi

# Test 3: Pattern Extraction
echo ""
echo "Test 3: Pattern Extraction"
echo "--------------------------"
PATTERNS_FOUND=0

# Check for key orchestration concepts in documentation
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    if grep -qi "agent" "$SKILL_DIR/SKILL.md"; then
        echo "✅ Mentions 'agent' pattern"
        PATTERNS_FOUND=$((PATTERNS_FOUND + 1))
    fi
    if grep -qi "orchestrat" "$SKILL_DIR/SKILL.md"; then
        echo "✅ Mentions 'orchestration'"
        PATTERNS_FOUND=$((PATTERNS_FOUND + 1))
    fi
    if grep -qi "delegate" "$SKILL_DIR/SKILL.md"; then
        echo "✅ Mentions 'delegation'"
        PATTERNS_FOUND=$((PATTERNS_FOUND + 1))
    fi
    if grep -qi "spawn\|session" "$SKILL_DIR/SKILL.md"; then
        echo "✅ Mentions 'spawn/session'"
        PATTERNS_FOUND=$((PATTERNS_FOUND + 1))
    fi
fi

if [ $PATTERNS_FOUND -ge 2 ]; then
    echo ""
    echo "✅ Found $PATTERNS_FOUND orchestration patterns"
else
    echo ""
    echo "⚠️  Only found $PATTERNS_FOUND patterns (expected at least 2)"
fi

# Test 4: Script/Tool Analysis
echo ""
echo "Test 4: Implementation Analysis"
echo "---------------------------------"
if [ -d "$SKILL_DIR/scripts" ]; then
    SCRIPT_COUNT=$(find "$SKILL_DIR/scripts" -type f -executable | wc -l)
    echo "✅ Found $SCRIPT_COUNT executable scripts"
    ls -la "$SKILL_DIR/scripts/"
else
    echo "ℹ️  No scripts directory"
fi

if [ -d "$SKILL_DIR/src" ]; then
    SRC_FILES=$(find "$SKILL_DIR/src" -type f | wc -l)
    echo "✅ Found $SRC_FILES source files"
else
    echo "ℹ️  No src directory"
fi

# Test 5: Dependencies Check
echo ""
echo "Test 5: Dependencies"
echo "--------------------"
if [ -f "$SKILL_DIR/package.json" ]; then
    echo "✅ Has package.json (Node.js dependencies)"
    echo "   Dependencies:"
    jq -r '.dependencies | keys[]' "$SKILL_DIR/package.json" 2>/dev/null | sed 's/^/     - /' || echo "     (none or parse error)"
else
    echo "ℹ️  No package.json (may be pure shell/skill)"
fi

# Test 6: Integration Potential
echo ""
echo "Test 6: Integration Assessment"
echo "--------------------------------"
echo "Checking compatibility with existing skills..."

# Check if it uses sessions_spawn (our preferred method)
if grep -r "sessions_spawn\|subagents" "$SKILL_DIR" 2>/dev/null; then
    echo "✅ Uses OpenClaw session/subagent patterns"
else
    echo "ℹ️  May use custom orchestration (check implementation)"
fi

# ============================================
# SKILL VALIDATION FRAMEWORK REPORT
# ============================================

echo ""
echo "========================================"
echo "Skill Validation Framework Report"
echo "========================================"

if [ -d "$VALIDATION_FRAMEWORK" ]; then
    cd "$VALIDATION_FRAMEWORK"
    
    # Security Scan
    echo ""
    echo "Security Scan:"
    echo "--------------"
    uv run skill-validate security "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Security scan failed"
    
    # Structure Validation
    echo ""
    echo "Structure Validation:"
    echo "---------------------"
    uv run skill-validate validate "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Validation failed"
    
    # Performance Benchmark
    echo ""
    echo "Performance Benchmark:"
    echo "----------------------"
    uv run skill-validate benchmark "$SKILL_DIR" --format text 2>/dev/null || echo "⚠️  Benchmark failed"
    
    # Full Report
    echo ""
    echo "Generating Full Report..."
    echo "-------------------------"
    REPORT_FILE="$PWD/validation-report-cc-godmode.md"
    uv run skill-validate report "$SKILL_DIR" --output "$REPORT_FILE" 2>/dev/null || echo "⚠️  Report generation failed"
    
    if [ -f "$REPORT_FILE" ]; then
        echo "✅ Report saved to: $REPORT_FILE"
        echo ""
        echo "Report Preview:"
        echo "---------------"
        head -30 "$REPORT_FILE"
    fi
else
    echo "⚠️  skill-validation-framework not found at:"
    echo "   $VALIDATION_FRAMEWORK"
    echo ""
    echo "Validation skipped. To enable:"
    echo "  1. Ensure skill-validation-framework is cloned"
    echo "  2. Run: uv sync in that directory"
fi

# Summary
echo ""
echo "==========================="
echo "Evaluation Summary"
echo "==========================="
echo ""
echo "Next steps:"
echo "  1. Review validation report above"
echo "  2. Document specific patterns in memory/openclaw-skills-research.md"
echo "  3. Update agentic-workflows-roadmap.md with findings"
echo "  4. Decide: adopt, adapt, or reject this skill"
echo ""
echo "To document findings:"
echo "  cat >> $RESEARCH_FILE << 'EOF'"
echo ""
echo "## cc-godmode Evaluation (YYYY-MM-DD)"
echo ""
echo "- Status: [installed/tested/rejected]"
echo "- Validation Score: [X.X/10]"
echo "- Security Issues: [count/severity]"
echo "- Patterns found: [list]"
echo "- Use case fit: [good/partial/none]"
echo "- Integration: [works with/needs adaptation/incompatible]"
echo ""
echo "EOF"
