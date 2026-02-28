---
layout: home
---

# OpenClaw Agentic Workflows Research

A comprehensive research repository documenting the OpenClaw skills ecosystem, multi-agent orchestration patterns, and agentic workflow design.

## Latest Research (February 28, 2026)

### February 28: External Framework Patterns
Comparative analysis of LangChain/LangGraph, CrewAI, OpenAI Swarm, and PydanticAI reveals convergent multi-agent patterns and OpenClaw's position relative to the ecosystem.

**Key Finding:** `sessions_spawn` is for delegation, not orchestration. For deterministic workflows, Lobster or `cc-godmode` patterns are needed.

**Critical Gap Identified:** Human-in-the-loop workflows — highest priority for production trust.

---

### February 27: Ecosystem Update

### Key Findings

- **5,705** community skills on ClawHub analyzed
- **2,868** curated skills in VoltAgent's awesome list
- **36%** of scanned skills have potential security issues
- **Rapid ecosystem maturation** — many gaps from Feb 25 now addressed

### Critical Insight

The ecosystem matured rapidly between February 25-27, 2026. Skills like `cc-godmode`, `agenticflow-skill`, and `claude-team` now address previously identified gaps in multi-agent orchestration.

## Research Documents

### [External Framework Patterns](research/external-framework-patterns.md)
Comparative analysis of LangChain/LangGraph, CrewAI, OpenAI Swarm/Agents SDK, and PydanticAI:
- Framework comparison matrix
- Five universal multi-agent patterns
- OpenClaw gap analysis with priorities
- Recommendations for implementation

### [Skills Ecosystem Research](research/openclaw-skills-research.md)
Comprehensive analysis of 5,705+ OpenClaw skills, including:
- Meta-development skills inventory
- Built-in skills analysis
- Security findings (Snyk scan results)
- ClawHub ecosystem structure

### [Implementation Roadmap](research/agentic-workflows-roadmap.md)
Actionable plan for building meta-development skills:
- Phase 1: Foundation ✅ Complete
- Phase 2: Evaluation & Prototype (Current)
- Phase 3: Build or Compose
- Phase 4: Integration

## Quick Stats

| Metric | Value |
|--------|-------|
| Frameworks Analyzed | 4 major + 10+ total |
| Universal Patterns Identified | 5 |
| High-Priority Gaps | 1 (human-in-the-loop) |
| Medium-Priority Gaps | 4 |
| Community Skills | 5,705 |
| Curated Skills | 2,868 |
| Built-in Skills | 52 |
| Security Issues | 36% of scanned |

## External Frameworks Covered

## External Frameworks Covered

- **Google ADK** — Eight essential multi-agent patterns
- **CrewAI** — 1.7 billion workflow analysis
- **LangChain/LangGraph** — StateGraph and routing patterns
- **AutoGPT** — Command pattern and memory hierarchy
- **OpenAI Swarm** — Routines and handoffs
- **AutoGen** — Group chat and nested conversations
- **MCP** — Model Context Protocol
- **Vellum** — Three levels of agentic workflows
- **AWCP** — Workspace delegation protocol

## License

MIT — Research findings are free to use and build upon.
