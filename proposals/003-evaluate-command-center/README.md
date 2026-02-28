# Proposal 003: Evaluate OpenClaw Command Center for Monitoring

## Summary
Install and evaluate the `openclaw-command-center` ClawHub skill for real-time session monitoring, LLM usage tracking, and cost intelligence.

## Motivation
We currently lack visibility into:
- Session performance and health
- LLM token usage and costs
- Active subagents and their status
- System vitals (memory, CPU, disk)

This makes it hard to optimize for reliability and cost-effectiveness.

## Changes
- Install `openclaw-command-center` skill from ClawHub
- Set up monitoring dashboard
- Track metrics over time
- Identify optimization opportunities

## Skill Validation Report

> **Note:** To be populated after installation via `test.sh`

### Security Scan
```bash
skill-validate security ~/.openclaw/workspace/skills/openclaw-command-center --format json
```

| Severity | Count | Status |
|----------|-------|--------|
| Critical | TBD | ⏳ |
| High | TBD | ⏳ |
| Medium | TBD | ⏳ |
| Low | TBD | ⏳ |

### Structure Validation
```bash
skill-validate validate ~/.openclaw/workspace/skills/openclaw-command-center --format json
```

| Test | Result |
|------|--------|
| SKILL.md exists | ⏳ |
| YAML frontmatter valid | ⏳ |
| Required fields present | ⏳ |

**Pass Rate:** TBD%

### Command Center Capabilities Test

**Expected Features:**
- Real-time session monitoring
- LLM usage tracking (tokens, cost)
- Subagent status dashboard
- System vitals (CPU, memory, disk)
- Historical metrics

### Overall Score
**TBD/10**

## Testing
1. **Installation Test** — Installs without errors
2. **Dashboard Launch** — Can start monitoring UI
3. **Session Tracking** — Tracks active sessions
4. **Cost Intelligence** — Reports token usage/costs
5. **Historical Data** — Stores metrics over time
6. **Integration Test** — Works with our cron/heartbeat system

## Integration
- Daily/weekly monitoring reports
- Cost alerts if usage spikes
- Performance baseline establishment
- Integration with self-direction protocol

## Rollback
```bash
rm -rf ~/.openclaw/workspace/skills/openclaw-command-center
```

## References
- ClawHub: openclaw-command-center (owner: jontsai)
- Related: SELF_DIRECTION.md (monitoring needs)
- Research: memory/agentic-workflows-roadmap.md
