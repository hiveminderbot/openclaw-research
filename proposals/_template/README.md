# Proposal XXX: [Name]

## Summary
Brief description of what this proposal does for the agentic workflows research.

## Motivation
Why is this needed? What gap does it fill?

## Changes
- List of changes made
- Files modified
- Skills installed/configured
- New patterns or workflows introduced

## Skill Validation Report

After installation, the skill is validated using the [skill-validation-framework](https://github.com/hiveminderbot/skill-validation-framework):

### Security Scan
```bash
skill-validate security ./path/to/skill --format json
```

| Severity | Count | Status |
|----------|-------|--------|
| Critical | 0 | ✅ |
| High | 0 | ✅ |
| Medium | 0 | ✅ |
| Low | 0 | ✅ |

**Security Issues:** None found / List any issues

### Structure Validation
```bash
skill-validate validate ./path/to/skill --format json
```

| Test | Result |
|------|--------|
| SKILL.md exists | ✅/❌ |
| YAML frontmatter valid | ✅/❌ |
| Required fields present | ✅/❌ |
| Scripts executable | ✅/❌ |
| References directory | ✅/❌ |

**Pass Rate:** X%

### Performance Benchmark
```bash
skill-validate benchmark ./path/to/skill --format json
```

| Metric | Value |
|--------|-------|
| Load Time | X ms |
| Metadata Extraction | X ms |
| Script Execution | X ms |
| Success Rate | X% |

### Overall Score
**X.X/10**

## Testing
What capabilities are tested:
1. Test 1 description
2. Test 2 description
3. etc.

## Integration
How this fits into the broader agentic workflows research.

## Rollback
How to undo this change if needed.

## References
- Related research in memory/
- External framework patterns
- ClawHub skills used
- Skill validation report (see above)
