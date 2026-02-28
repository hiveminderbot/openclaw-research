# External Framework Patterns — Multi-Agent Orchestration Research

**Research Date:** February 28, 2026

## Executive Summary

This research synthesizes patterns from four major agent frameworks — LangChain/LangGraph, CrewAI, OpenAI Swarm/Agents SDK, and PydanticAI — to identify transferable patterns for OpenClaw's skill system. The analysis reveals convergent architectures across frameworks and highlights specific gaps in OpenClaw's current capabilities.

---

## Framework Comparison Matrix

| Framework | Subagents | Skills | Handoffs | Router | Type Safety | Best For |
|-----------|-----------|--------|----------|--------|-------------|----------|
| LangChain | ✅ | ✅ | ✅ | ✅ | ⚠️ | Complex state machines |
| CrewAI | ✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | Production workflows |
| Swarm/Agents SDK | ✅ | ❌ | ✅ | ❌ | ❌ | Lightweight orchestration |
| PydanticAI | ✅ | ❌ | ⚠️ | ❌ | ✅ | Type-safe applications |
| **OpenClaw** | ✅ | ✅ | ⚠️ | ⚠️ | ❌ | Multi-channel agents |

---

## Key Patterns Identified

### 1. Hierarchical Orchestration (Universal)
**Pattern:** Supervisor agent coordinates specialized workers
- **LangChain:** Subagents pattern
- **CrewAI:** Crews with role-based agents
- **Swarm:** Agent handoffs
- **OpenClaw:** `sessions_spawn` ✅

### 2. Progressive Disclosure
**Pattern:** Load specialized capabilities on-demand
- **LangChain:** Skills pattern (quasi-multi-agent)
- **OpenClaw:** Skill loading system ✅

### 3. Deterministic Backbone + Intelligence
**Pattern:** Code controls flow; AI handles specific steps
- **CrewAI:** Flows (deterministic) + Crews (intelligent)
- **OpenClaw:** Cron/heartbeat + skill execution ✅

### 4. State-Driven Handoffs
**Pattern:** Conversation state determines agent transitions
- **LangChain:** Handoffs pattern
- **Swarm:** Agent transfer via function calls
- **OpenClaw:** ⚠️ Limited support

### 5. Parallel Dispatch (Router)
**Pattern:** Multiple agents process simultaneously, results synthesized
- **LangChain:** Router pattern
- **OpenClaw:** ❌ Not implemented

---

## OpenClaw Gap Analysis

### Where OpenClaw Matches or Exceeds

| Capability | Status | Notes |
|------------|--------|-------|
| Subagent spawning | ✅ | `sessions_spawn` well-implemented |
| Skill composition | ✅ | Progressive disclosure works |
| Cron scheduling | ✅ | Built-in, flexible |
| Heartbeat polling | ✅ | Unique to OpenClaw |
| Multi-channel | ✅ | Telegram, Discord, etc. |
| File/memory management | ✅ | Built-in |

### Identified Gaps (Priority Order)

| Priority | Gap | Impact | Potential Solution |
|----------|-----|--------|-------------------|
| **High** | Human-in-the-loop | Production trust | Approval workflow skill |
| **Medium** | Stateful handoffs | Conversation flow | State tracking between skills |
| **Medium** | Role definitions | Clear boundaries | Skill metadata enhancement |
| **Medium** | Parallel execution | Multi-source queries | Router skill |
| **Medium** | Cost tracking | Production ops | Token usage per session |
| **Low** | Type-safe tools | Code quality | Optional Pydantic validation |
