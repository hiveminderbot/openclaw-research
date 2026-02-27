# OpenClaw Skills Ecosystem Research

**Last Updated:** February 27, 2026  
**Research Scope:** OpenClaw native skills, ClawHub ecosystem, external framework patterns  
**Skills Analyzed:** 5,705 community + 52 built-in + 2,868 curated

---

## Executive Summary

This research documents a comprehensive analysis of the OpenClaw skills ecosystem conducted February 25-27, 2026. The ecosystem demonstrated rapid maturation during this period, with many previously identified gaps being addressed by new community skills.

### Key Statistics

| Metric | Value |
|--------|-------|
| Total Community Skills | 5,705 |
| Curated Skills (VoltAgent) | 2,868 |
| Built-in OpenClaw Skills | 52 |
| Skills with Security Issues | 36% (1,467 of 3,984 scanned) |
| Confirmed Malicious | 76 |
| Meta-Development Skills | 18+ identified |

### Security Notice

> ⚠️ **Critical Finding:** Snyk scan found 36% of skills have potential security issues including prompt injection vulnerabilities. Always review source code before installing skills in production environments.

---

## Table of Contents

1. [Ecosystem Overview](#ecosystem-overview)
2. [Meta-Development Skills](#meta-development-skills)
3. [Built-in Skills Inventory](#built-in-skills-inventory)
4. [External Framework Research](#external-framework-research)
5. [Gap Analysis](#gap-analysis)
6. [Actionable Recommendations](#actionable-recommendations)

---

## Ecosystem Overview

### ClawHub Registry Structure

ClawHub serves as the central registry for OpenClaw skills with the following characteristics:

- **Installation**: `npx clawhub@latest install <skill-slug>`
- **Locations** (priority order):
  1. Project workspace: `<project>/skills/`
  2. Global: `~/.openclaw/skills/`
  3. Bundled: Shipped with npm package

### Skill Categories

| Category | Count | Notable Skills |
|----------|-------|----------------|
| Agent-to-Agent Protocols | 18 | agent-protocol, agent-task, agent-council |
| Coding Agents & IDEs | 133 | coding-agent, claude-team, cursor-agent |
| Meta-Development | 18+ | cc-godmode, agenticflow-skill, buildlog |
| Browser Automation | 12 | browse, browser-automation, agent-browser |
| Workflow & Automation | 25+ | toggle, workspace, docker-sandbox |

---

## Meta-Development Skills

Skills that enable building other skills or orchestrating agent workflows.

### High Priority

#### cc-godmode
- **Author:** cubetribe
- **Version:** 5.11.3
- **Description:** Self-orchestrating multi-agent development workflows
- **Pattern:** "You say WHAT, the AI decides HOW"
- **Subagents:** 8 specialized agents (researcher, architect, api-guardian, builder, validator, tester, scribe, github-manager)
- **Key Insight:** Implements Google's 8 essential multi-agent patterns with deterministic workflows

#### agenticflow-skill
- **Description:** Comprehensive guide for building AI workflows
- **Use Case:** Workflow orchestration patterns
- **Status:** Addresses workflow state machine gap

#### claude-team
- **Description:** Orchestrate multiple Claude Code workers via iTerm2
- **Pattern:** MCP-based multi-agent coordination
- **Key Insight:** Uses Model Context Protocol for agent communication

### Medium Priority

| Skill | Purpose | Meta-Dev Relevance |
|-------|---------|-------------------|
| buildlog | Record/replay AI coding sessions | Session observability |
| agent-protocol | Agent-to-agent communication | Inter-agent messaging |
| agent-task | Task delegation between agents | Task distribution |
| agent-council | Autonomous AI agent toolkit | Multi-agent governance |
| arbiter | Async human review | Human-in-the-loop |

---

## Built-in Skills Inventory

### Core Meta-Development Skills

| Skill | Location | Purpose | Key Capabilities |
|-------|----------|---------|------------------|
| skill-creator | `/usr/lib/node_modules/openclaw/skills/skill-creator/` | Create/package skills | init, validate, package |
| coding-agent | `/usr/lib/node_modules/openclaw/skills/coding-agent/` | Spawn coding agents | Codex, Claude, OpenCode, Pi |
| clawhub | `/usr/lib/node_modules/openclaw/skills/clawhub/` | Skill registry | search, install, update, publish |
| tmux | `/usr/lib/node_modules/openclaw/skills/tmux/` | Process orchestration | Isolated sockets, parallel agents |

### Skill Structure Pattern

Every skill follows this anatomy:

```
skill-name/
├── SKILL.md              # Required: YAML frontmatter + instructions
├── scripts/              # Optional: Executable code
├── references/           # Optional: On-demand documentation
└── assets/               # Optional: Templates, boilerplate
```

**Progressive Disclosure:**
- Metadata: Always loaded
- Body: Loaded when skill triggered
- References: Loaded only when explicitly needed

---

## External Framework Research

### Google's Eight Essential Patterns (ADK)

From Google Agent Development Kit (January 2026):

| Pattern | Description | OpenClaw Status |
|---------|-------------|-----------------|
| Sequential Pipeline | Assembly line of agents | ✅ Native |
| Coordinator/Dispatcher | Central routing agent | ⚠️ Partial |
| Parallel Fan-Out/Gather | Simultaneous subtasks | ⚠️ Partial |
| Hierarchical Decomposition | Goal breakdown | ⚠️ Partial |
| Generator and Critic | Two-phase validation | ❌ Gap |
| Iterative Refinement | Feedback loops | ❌ Gap |
| Human-in-the-Loop | Approval gates | ⚠️ Partial |
| Composite | Pattern combinations | ⚠️ Partial |

### CrewAI Enterprise Insights

From analysis of 1.7 billion workflows:

**Winning Pattern:**
```
Deterministic Backbone (Flows) + Intelligence Where It Matters (Agents)
```

**Critical Lesson:**
> "Teams regret graph-based architectures that look great in screenshots but become debugging nightmares."

OpenClaw's flat skill system avoids this trap by design.

### Vellum's Three Levels

| Level | Decisions | OpenClaw Status |
|-------|-----------|-----------------|
| 1. AI Workflows | Output decisions | ✅ Native |
| 2. Router Workflows | Task decisions | ⚠️ Partial |
| 3. Autonomous Agents | Process decisions | ❌ Gap |

### AWCP: Workspace Delegation Protocol

**Core Innovation:** Files-as-interface paradigm
- Delegator projects workspace to Executor
- Executor operates directly on original files
- Native toolchain integration

**OpenClaw Alignment:**
- Workspace-centric design matches philosophy
- Gap: No formal cross-agent workspace sharing protocol

---

## Gap Analysis

### Resolved Gaps (Feb 25-27, 2026)

| Gap | Previous Status | Solution |
|-----|-----------------|----------|
| Workflow state machine | ❌ Gap | `agenticflow-skill`, `cc-godmode` |
| Multi-agent chat | ❌ Gap | `claude-team`, `agent-council` |
| Agent-to-agent messaging | ❌ Gap | `agent-protocol`, `agent-task` |
| Workflow tracing | ❌ Gap | `buildlog`, `codex-monitor` |
| Session observability | ❌ Gap | `buildlog` |

### Persistent Gaps

| Gap | Impact | Potential Solution |
|-----|--------|-------------------|
| **Validation layers** | High | LLM-as-judge skill |
| **Generator/Critic pattern** | High | Two-phase validation skill |
| **Iterative refinement** | Medium | Feedback loop skill |
| **Agent training/feedback** | Medium | Learning loop skill |
| **Deterministic workflow backbone** | High | State machine skill |

### OpenClaw Strengths

1. **Skill-Based Simplicity** — Flat, explicit, debuggable
2. **Progressive Disclosure** — Efficient resource loading
3. **Built-in Tooling** — 52+ skills out of box
4. **Session Isolation** — Clean agent separation
5. **Channel Agnostic** — Universal messaging
6. **Markdown-Native** — Human-readable, version-controllable

---

## Actionable Recommendations

### Immediate (This Week)

1. **Install ClawHub CLI**
   ```bash
   npm i -g clawhub
   ```

2. **Evaluate cc-godmode**
   ```bash
   npx clawhub@latest install cc-godmode
   ```
   - Study self-orchestration patterns
   - Assess against agent-delegate concept

3. **Evaluate agenticflow-skill**
   ```bash
   npx clawhub@latest install agenticflow-skill
   ```
   - Extract workflow patterns
   - Compare to workflow-orchestrator concept

### Short-term (Next 2 Weeks)

4. **Evaluate claude-team**
   ```bash
   npx clawhub@latest install claude-team
   ```
   - Understand MCP-based coordination
   - Compare to sessions_spawn approach

5. **Assess Mission Control/Convex**
   - Evaluate for production multi-agent needs
   - Decide: external infrastructure vs. pure OpenClaw

### Medium-term (Next Month)

6. **Prototype validation skill** (if gap confirmed)
   - LLM-as-judge pattern
   - Three-layer validation (CrewAI-inspired)

7. **Consider MCP bridge**
   - Access to 75+ connectors
   - Standardize tool integration

---

## Research Methodology

### Sources
- VoltAgent/awesome-openclaw-skills (2,868 curated)
- ClawHub registry (5,705 total)
- DigitalOcean OpenClaw guide
- Convex integration docs
- Snyk security research
- Framework docs: LangChain, CrewAI, AutoGPT, AutoGen, OpenAI Swarm, MCP, Google ADK, Vellum, AWCP

### Limitations
- Cannot directly browse ClawHub without CLI
- Skill descriptions may not reflect full capabilities
- Security audits are point-in-time

---

## Conclusion

The OpenClaw skills ecosystem has matured rapidly, with many gaps from February 25 now addressed by community skills. The research phase is complete; evaluation and prototyping should begin.

**Key Takeaway:** Don't build from scratch — study existing solutions first, then identify what's truly missing.

**Next Phase:** Install and analyze `cc-godmode`, `agenticflow-skill`, and `claude-team` to determine if remaining gaps require custom development.
