# Proposal 002: Evaluate ClawSentinel for Security Auditing

## Summary
Install and evaluate the `clawsentinel` ClawHub skill to enhance security auditing of installed skills. This complements our existing skill-validation-framework with malware-specific detection.

## Motivation
We currently validate skills for structure and basic security patterns, but we lack:
- Malware detection (ClawHavoc, MCP backdoors)
- Obfuscated payload detection
- Supply-chain attack detection

The cc-godmode evaluation revealed a VirusTotal false positive — having a dedicated security scanner would provide confidence in skill safety.

## Changes
- Install `clawsentinel` skill from ClawHub
- Run security audit on all installed skills
- Compare findings with skill-validation-framework results
- Integrate into proposal workflow (security gate)

## Skill Validation Report

> **Note:** To be populated after installation via `test.sh`

### Security Scan
```bash
skill-validate security ~/.openclaw/workspace/skills/clawsentinel --format json
```

| Severity | Count | Status |
|----------|-------|--------|
| Critical | TBD | ⏳ |
| High | TBD | ⏳ |
| Medium | TBD | ⏳ |
| Low | TBD | ⏳ |

### Structure Validation
```bash
skill-validate validate ~/.openclaw/workspace/skills/clawsentinel --format json
```

| Test | Result |
|------|--------|
| SKILL.md exists | ⏳ |
| YAML frontmatter valid | ⏳ |
| Required fields present | ⏳ |

**Pass Rate:** TBD%

### ClawSentinel Capabilities Test
```bash
# Scan all installed skills
clawsentinel scan ~/.openclaw/workspace/skills/
```

**Expected Detections:**
- ClawHavoc malware signatures
- MCP backdoor patterns
- Obfuscated JavaScript/Python
- Supply-chain indicators

### Overall Score
**TBD/10**

## Testing
1. **Installation Test** — Installs without errors
2. **Self-Scan** — clawsentinel can scan itself
3. **Installed Skills Audit** — Scan all current skills:
   - self-improving-agent
   - agent-team-orchestration
   - dispatching-parallel-agents
   - cc-godmode
4. **False Positive Check** — Compare with known-good skills
5. **Integration Test** — Add to proposal CI workflow

## Integration
- Add as **security gate** in proposal workflow
- Run on all new skill installations
- Weekly scheduled audit of installed skills
- Complements (not replaces) skill-validation-framework

## Rollback
```bash
rm -rf ~/.openclaw/workspace/skills/clawsentinel
```

## References
- ClawHub: clawsentinel (owner: chuddyrudd)
- Related: skill-validation-framework (our existing validator)
- Research: memory/agentic-workflows-roadmap.md
