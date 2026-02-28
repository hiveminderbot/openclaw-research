# Proposal Naming Convention

## Problem
Sequential integer IDs (001, 002, 003) cause conflicts when:
- Multiple proposals are developed in parallel
- Subagents work on different proposals simultaneously
- Branches need to be merged independently

## Solution: Timestamp-Based IDs

Format: `YYYYMMDD-HHMM-{descriptive-name}`

Examples:
- `20260228-0930-evaluate-clawsentinel`
- `20260228-0945-evaluate-command-center`
- `20260228-1000-evaluate-cortex-memory`

## Benefits

1. **Parallel Development** — No ID conflicts
2. **Chronological Order** — Natural sorting
3. **Self-Documenting** — Date + purpose in name
4. **Git Worktree Compatible** — Each proposal in separate directory

## Git Worktrees for Parallel Development

### What are Git Worktrees?

Git worktrees allow you to have multiple branches checked out simultaneously in different directories — no more `git stash` and `git checkout` dance.

### Setup for Proposals

```bash
# Main workspace
cd ~/workspace/research-site

# Create worktrees for parallel proposals
git worktree add ../proposal-20260228-0930-clawsentinel proposal/20260228-0930-clawsentinel
git worktree add ../proposal-20260228-0945-command-center proposal/20260228-0945-command-center

# Now you have:
# ~/workspace/research-site          (main branch)
# ~/workspace/proposal-20260228-0930-clawsentinel  (clawsentinel proposal)
# ~/workspace/proposal-20260228-0945-command-center (command-center proposal)
```

### Worktree Commands

```bash
# List worktrees
git worktree list

# Create new worktree from current branch
git worktree add ../new-feature-dir new-branch-name

# Remove worktree when done
git worktree remove ../proposal-20260228-0930-clawsentinel

# Prune stale worktrees
git worktree prune
```

### Subagent Pattern with Worktrees

Each subagent gets its own worktree:

```bash
# Subagent 1: Security research
git worktree add /tmp/agent-security proposal/20260228-0930-clawsentinel
cd /tmp/agent-security
# ... do work ...

# Subagent 2: Monitoring research (parallel, no conflict)
git worktree add /tmp/agent-monitoring proposal/20260228-0945-command-center
cd /tmp/agent-monitoring
# ... do work ...
```

## Migration Path

Existing proposals keep their integer IDs:
- `001-evaluate-cc-godmode` → keep
- `002-evaluate-clawsentinel` → keep

New proposals use timestamp format:
- `20260228-1000-evaluate-cortex-memory`
- `20260228-1015-evaluate-reminder-cron`

## CI Adaptation

The CI workflow needs to handle both formats:

```bash
# Find proposals (both formats)
git diff --name-only origin/main...HEAD | \
  grep '^proposals/' | \
  grep -v '^proposals/_template' | \
  grep -v '^proposals/README.md' | \
  cut -d'/' -f2 | sort -u
```

This works for:
- `001-evaluate-cc-godmode`
- `20260228-0930-evaluate-clawsentinel`
