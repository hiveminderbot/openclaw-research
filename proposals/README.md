# Proposals

**Purpose:** Structured evaluation of agentic workflow patterns and skills.

Each proposal is a self-contained experiment that can be reviewed, tested, and merged (or rejected).

## Proposal Structure

```
proposals/
├── _template/              # Copy this to create new proposals
│   ├── README.md          # Proposal description
│   ├── install.sh         # Installation script
│   └── test.sh            # Validation tests
├── 001-evaluate-cc-godmode/   # Example: Skill evaluation
│   ├── README.md
│   ├── install.sh
│   └── test.sh
└── ...
```

## Creating a Proposal

1. Copy `_template/` to `NNN-proposal-name/`
2. Fill in README.md with motivation, changes, testing plan
3. Implement install.sh (idempotent, safe to run multiple times)
4. Write test.sh that validates the capability
5. Submit PR for review

## Proposal Lifecycle

| Stage | Status | Action |
|-------|--------|--------|
| Draft | 📝 | Work in progress, not ready for review |
| Ready | 👀 | PR submitted, awaiting review |
| Approved | ✅ | Merged, capability integrated |
| Rejected | ❌ | Closed, findings documented |

## Review Criteria

- **Safety**: Can this be tested without breaking existing work?
- **Reversibility**: Is there a clear rollback plan?
- **Documentation**: Are patterns and findings captured?
- **Integration**: How does this fit the broader research?

## Current Proposals

| # | Proposal | Status | Purpose |
|---|----------|--------|---------|
| 001 | Evaluate cc-godmode | 📝 Draft | Multi-agent orchestration patterns |

