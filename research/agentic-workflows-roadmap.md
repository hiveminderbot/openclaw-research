# Agentic Workflows Roadmap

**Purpose:** Actionable implementation plan for building meta-development skills and agentic workflows in OpenClaw.

**Status:** Phase 1 Complete — Research Updated with Feb 27 Findings

---

## Phase 1: Foundation ✅ COMPLETE
- [x] Inventory existing skills — 52 built-in + 1 user-installed found
- [x] Study skill-creator skill — Documented structure, packaging, progressive disclosure
- [x] Study coding-agent skill — Delegation patterns with PTY support
- [x] Study clawhub skill — Distribution patterns (search/install/update/publish)
- [x] Study tmux skill — Process orchestration via isolated sockets
- [x] Document skill structure patterns — Anatomy, composition, triggering
- [x] Research external frameworks — LangChain, CrewAI, AutoGPT, OpenAI Swarm, AutoGen
- [x] Map gaps in current ecosystem — 7 gaps identified, 7 potential new skills listed
- [x] **Feb 27: Research ClawHub ecosystem** — 5,705 skills, new meta-development skills identified

## Phase 2: Evaluation & Prototype (Current)
**Goal:** Evaluate existing skills and build first meta-development skill to validate patterns

**Key Insight from Feb 27 Research:**
The ecosystem is rapidly maturing. Several skills now address previously identified gaps:
- `cc-godmode` — Self-orchestrating multi-agent workflows
- `agenticflow-skill` — AI workflow building guide
- `claude-team` — Multi-agent coordination via MCP
- `agent-protocol` — Agent-to-agent communication
- `buildlog` — Session observability

**Revised Strategy:** Don't build from scratch — study existing solutions first, then identify what's missing.

**Critical Finding:** Snyk scan found 36% of 3,984 skills have potential security issues; 76 confirmed malicious. Review source before installing.

**Immediate Actions (This Week):**
1. **Install and analyze `cc-godmode`** — Self-orchestrating multi-agent workflows
2. **Install and analyze `agenticflow-skill`** — AI workflow building patterns
3. **Install and analyze `claude-team`** — MCP-based multi-agent coordination

**Validation Questions:**
- Do these skills solve our use cases?
- What gaps remain after using them?
- Can we compose them or do we need new skills?
- Are they secure enough for our use case?

## Phase 3: Build or Compose
- [ ] Evaluate existing skills against requirements
- [ ] Build custom skills only for proven gaps
- [ ] Document usage patterns
- [ ] Create example workflows

## Phase 4: Integration
- [ ] Test with real agentic software delivery scenarios
- [ ] Iterate based on usage
- [ ] Publish to ClawHub (if building new skills)

---

## New Actionable Items (Feb 27, 2026)

### Immediate (This Week)

#### 1. Install ClawHub CLI
```bash
npm i -g clawhub
```
*Needed for: Installing and analyzing new skills*

#### 2. Install and Analyze `cc-godmode`
**What to study:**
- How it handles self-orchestration
- Multi-agent coordination patterns
- What "godmode" means in practice

**Key question:** Does this replace our `agent-delegate` concept or complement it?

**Install:**
```bash
npx clawhub@latest install cc-godmode
```

#### 3. Install and Analyze `agenticflow-skill`
**What to study:**
- Workflow building patterns
- How it guides AI workflow creation
- Integration with existing tools

**Key question:** Does this provide the workflow orchestration we need?

**Install:**
```bash
npx clawhub@latest install agenticflow-skill
```

#### 4. Install and Analyze `claude-team`
**What to study:**
- MCP-based coordination pattern
- How it integrates with iTerm2
- Multi-worker orchestration approach

**Key question:** Is MCP the right abstraction for our use case?

**Install:**
```bash
npx clawhub@latest install claude-team
```

### Short-term (Next 2 Weeks)

#### 5. Evaluate Mission Control / Convex
**What it is:** Production multi-agent orchestration platform built on Convex

**Key capabilities:**
- Shared database for agent state
- Real-time agent communication
- Web UI for monitoring

**Key question:** Do we need external infrastructure or can we stay pure OpenClaw?

**Action:** Read Mission Control guide, evaluate fit for our use case

#### 6. Prototype Quality Validation Skill (if gap confirmed)
**What it does:** LLM-as-judge pattern for quality assurance

**Use case:** Code review, output validation, hallucination detection

**Only build if:** Existing skills don't provide this capability

### Medium-term (Next Month)

#### 7. Consider MCP Bridge Skill
**What it does:** Connect OpenClaw to MCP ecosystem (75+ connectors)

**Benefits:**
- Standardized tool integration
- Access to broader tool ecosystem
- Future-proofing

**Trade-off:** Adds dependency on external protocol

---

## Updated Gap Analysis (Feb 27, 2026)

### Previously Identified Gaps — Status

| Gap | Previous Status | Feb 27 Update | Action |
|-----|-----------------|---------------|--------|
| Workflow state machine | ❌ GAP | **Addressed** by `agenticflow-skill`, `cc-godmode` | Evaluate existing solutions |
| Vector/semantic memory | ❌ GAP | **Partial** — `agentic-ai-gold` has 5-layer memory | Monitor, may not need immediately |
| Multi-agent chat | ❌ GAP | **Addressed** by `claude-team`, `agent-council` | Evaluate `claude-team` |
| Agent-to-agent messaging | ❌ GAP | **Addressed** by `agent-protocol`, `agent-task` | Evaluate `agent-protocol` |
| Task abstraction | ❌ GAP | **Partial** — `agent-task`, `workspace` emerging | Evaluate `agent-task` |
| Human-in-the-loop gates | ⚠️ PARTIAL | **Partial** — `arbiter` skill for async review | May be sufficient |
| Validation layers | ❌ GAP | **Unchanged** — No built-in quality checks | **Potential build target** |
| Workflow tracing | ❌ GAP | **Addressed** by `buildlog`, `codex-monitor` | Evaluate `buildlog` |
| Agent training/feedback | ❌ GAP | **Unchanged** — No explicit training | **Potential build target** |
| Standardized tool protocol | ❌ GAP | **Unchanged** — MCP emerging | Consider MCP bridge |

### New Opportunities

1. **Integration with Mission Control/Convex** — For production deployments
2. **Quality validation skill** — If existing solutions don't meet needs
3. **Agent training/feedback loop skill** — Learn from corrections over time
4. **MCP bridge skill** — Connect to broader ecosystem

### Research Phase: Complete ✅
**Status:** Research phase concluded Feb 27, 2026. Sufficient information gathered to proceed with evaluation and prototyping.

**What was accomplished:**
- Comprehensive inventory of 52+ built-in OpenClaw skills
- Deep analysis of meta-development skills (skill-creator, coding-agent, clawhub, tmux)
- External framework research: LangChain, CrewAI, AutoGPT, AutoGen, OpenAI Swarm, MCP, Google ADK, Vellum, AWCP
- Gap analysis with comparison tables
- Ecosystem scan: 5,705 ClawHub skills, security findings (36% issues), new meta-development skills identified
- Actionable roadmap with prioritized skill candidates

**Key findings:**
- OpenClaw's simplicity is intentional — avoids "graph architecture debugging nightmare"
- Progressive disclosure pattern is a core strength
- Ecosystem matured rapidly (Feb 25-27) — many gaps now addressed
- Security is a real concern — review before installing
- Research is complete; evaluation and prototyping should begin

---

## Research Insights Applied

### From LangChain/LangGraph:
- Orchestrator-worker pattern is well-established — our `agent-delegate` aligns
- StateGraph is powerful but adds complexity — avoid unless proven necessary

### From CrewAI:
- "Separate predictable from unpredictable" — deterministic flow + strategic agent deployment
- Trust gradient: start with human review, dial down as system proves itself
- Three-layer validation (LLM-as-judge, hallucination check, API scoring) — consider for quality-critical skills

### From Feb 27 ClawHub Research:
- **Ecosystem is maturing fast** — Many gaps from Feb 26 are now addressed
- **Don't build what you can install** — Check ClawHub before building
- **Study before building** — Existing skills may solve 80% of needs
- **Security matters** — 36% of skills have issues; review source before installing

---

## Open Questions (Updated Feb 27)

1. **Gap Reality Check:** Do `cc-godmode`, `agenticflow-skill`, and `claude-team` solve our use cases?
2. **Build vs. Buy:** Which gaps require custom skills vs. composing existing ones?
3. **External Infrastructure:** Do we need Mission Control/Convex or can we stay pure OpenClaw?
4. **MCP Integration:** Should we adopt MCP as a standard or stay with native skills?
5. **Validation Strategy:** Do existing skills provide quality checks or do we need to build?

---

## Historical: Phase 1 Research Summary

**What was accomplished (Feb 25-26):**
- Comprehensive inventory of 52+ built-in OpenClaw skills
- Deep analysis of meta-development skills (skill-creator, coding-agent, clawhub, tmux)
- External framework research: LangChain, CrewAI, AutoGPT, AutoGen, OpenAI Swarm, MCP
- Gap analysis with comparison table
- Actionable roadmap with prioritized skill candidates

**What we learned:**
- OpenClaw's simplicity is intentional — avoids "graph architecture debugging nightmare"
- Progressive disclosure pattern is a core strength
- 7 gaps identified but many may be solvable with skill composition
- Need to prototype to validate which gaps are real blockers

**Feb 27 Update:**
- Ecosystem moved fast — many gaps now addressed by new skills
- Strategy shift: Study existing solutions before building
- Focus on evaluation and composition, not creation

---

## Next Steps (Feb 27, 2026)

1. **Install ClawHub CLI** — Enable skill installation
2. **Install `cc-godmode`, `agenticflow-skill`, `claude-team`** — Study existing solutions
3. **Evaluate against requirements** — Do they meet our needs?
4. **Identify remaining gaps** — Only build what doesn't exist
5. **Decide on Mission Control** — External infrastructure or pure OpenClaw?

**Research Phase:** Complete
**Evaluation Phase:** Ready to begin
