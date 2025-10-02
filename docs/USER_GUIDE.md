# Claude Code Orchestration Guide

Focused on complex workflows, output style combinations, and Plan Mode integration.

---

## Plan Mode Overview

**Activate:** Press `Shift+Tab` twice
**Deactivate:** Press `Shift+Tab` once

When active, Claude **will not** edit files, run commands, or change anything until you approve. Separates research/planning from execution for maximum safety.

**Use Plan Mode when:**
- Complex multi-file features
- Unfamiliar codebase areas
- High-stakes refactoring
- You want to review strategy before execution

---

## Output Styles × Commands × Plan Mode

### Output Styles Quick Reference

| Style | Research Depth | Implements Code | Deploys Agents | Best With |
|-------|---------------|-----------------|----------------|-----------|
| **main** | Moderate | Yes (simple) or delegates | Yes (complex tasks) | Direct work, known patterns |
| **planning** | Deep | NO | Yes (research) | Plan Mode + /orchestrate |
| **brainstorming** | Light | No | Rarely | Requirement discovery |
| **deep-research** | Very Deep | No | Yes (parallel research) | Understanding complex systems |
| **business-panel** | Strategic | No | No | Business/strategic decisions |

---

## Workflow Patterns

### Pattern 1: Complex Feature from Scratch

**When:** 4+ files, needs parallel work, unfamiliar patterns

```bash
Step 1: Activate Plan Mode (Shift+Tab twice)
Step 2: /output-style planning
Step 3: "Implement user notification system with email and push support"
Step 4: Claude researches (deploys code-finder agents, maps dependencies)
Step 5: Claude presents multi-phase plan with file:line citations
Step 6: Review plan → approve (Shift+Tab to exit Plan Mode)
Step 7: /orchestrate
Step 8: Claude spawns parallel agents (backend-developer, frontend-ui-developer)
Step 9: Agents report completion with file changes
Step 10: Claude verifies integration, runs type checks
```

**Why this works:**
- Planning mode researches without touching code
- Plan Mode safety layer before orchestration
- Parallel agents maximize throughput
- Orchestrator coordinates without implementing

---

### Pattern 2: Bug Investigation → Fix

**When:** Complex bug, unclear root cause

```bash
Step 1: /output-style main (or planning if very complex)
Step 2: Spawn root-cause-analyzer agent
Step 3: "Authentication fails intermittently for mobile users"
Step 4: Agent investigates, generates hypotheses with evidence
Step 5: Agent reports: "Race condition in token refresh (auth/refresh.ts:45)"
Step 6: Review diagnosis
Step 7: /output-style main
Step 8: "Fix the race condition identified in auth/refresh.ts:45"
Step 9: Claude implements fix directly (simple scope)
```

**Alternative for complex fix:**
```bash
Steps 1-6: Same as above
Step 7: Activate Plan Mode (Shift+Tab twice)
Step 8: /output-style planning
Step 9: "Plan fix for race condition including tests"
Step 10: Review plan → approve
Step 11: /orchestrate (spawns backend-developer + test agent)
```

---

### Pattern 3: Architectural Understanding

**When:** New codebase, need to understand structure before changes

```bash
Step 1: /output-style deep-research
Step 2: "Map the authentication architecture and all integration points"
Step 3: Claude deploys parallel research agents:
        - code-finder-advanced: Auth flow tracing
        - code-finder-advanced: Security audit
        - codebase-research-analyst: Dependency mapping
Step 4: Claude synthesizes findings with confidence ratings
Step 5: /save-to-md .docs/research/auth-architecture.md
Step 6: Now make changes with full context
```

**Then proceed with changes:**
```bash
Step 7: Activate Plan Mode
Step 8: /output-style planning
Step 9: "Add OAuth2 provider support to existing auth system"
Step 10: Claude creates plan leveraging research from Steps 1-5
Step 11: Approve → /orchestrate
```

---

### Pattern 4: Unclear Requirements

**When:** User request is vague or exploratory

```bash
Step 1: /output-style brainstorming
Step 2: User: "I want to improve the dashboard"
Step 3: Claude asks:
        🤔 What specific problems are users facing?
        🤔 Which metrics matter most?
        🤔 Current vs desired user experience?
Step 4: User answers questions
Step 5: Claude generates structured brief with requirements
Step 6: /output-style planning
Step 7: Activate Plan Mode
Step 8: Claude creates implementation plan based on brief
Step 9: Review → approve → /orchestrate
```

---

### Pattern 5: Refactoring Large System

**When:** Multi-module refactor, high risk of breakage

```bash
Step 1: Activate Plan Mode (critical for safety)
Step 2: /output-style planning
Step 3: "Refactor user service to use repository pattern"
Step 4: Claude researches:
        - Maps all files touching user data (Grep + code-finder)
        - Identifies dependencies (import chains)
        - Creates phased plan with rollback points
Step 5: Review plan carefully (Plan Mode prevents accidents)
Step 6: Approve → exit Plan Mode
Step 7: /orchestrate
Step 8: Phase 1: Create repository interfaces (implementor agent)
Step 9: Phase 2: Parallel refactoring by module (3x implementor agents)
Step 10: Phase 3: Integration testing
Step 11: /fix-build (if needed)
Step 12: Manual testing
Step 13: "It's time to push commits and to update the documentation"
```

---

### Pattern 6: Rapid Iteration (Known Territory)

**When:** Small changes, familiar code, low risk

```bash
Step 1: Keep main style (default)
Step 2: "Add validation to email field in registration form"
Step 3: Claude implements directly (no agents needed)
Step 4: Done in 30 seconds
```

**No Plan Mode, no orchestration needed.**

---

## Decision Matrix: Which Pattern?

| Scenario | Output Style | Plan Mode? | Command | Agents? |
|----------|-------------|------------|---------|---------|
| Small fix (<3 files) | main | No | None | No |
| Complex feature (4+ files) | planning | Yes | /orchestrate | Yes (parallel) |
| Bug diagnosis | main | No | spawn root-cause-analyzer | Yes (1 agent) |
| Architecture research | deep-research | No | None | Yes (parallel) |
| Unclear requirements | brainstorming → planning | Yes (planning phase) | /orchestrate | Yes |
| Risky refactor | planning | **YES** | /orchestrate | Yes (phased) |
| Code discovery | main | No | spawn code-finder | Yes (1-2 agents) |

---

## Advanced Orchestration Tips

### Tip 1: Pre-Create Shared Dependencies
```
planning mode researches patterns
→ You implement shared types/interfaces manually
→ /orchestrate spawns agents with those types
→ Prevents conflicting assumptions
```

### Tip 2: Phased Orchestration
```
Phase 1: /orchestrate (foundation: DB, types)
Phase 2: Wait for completion, verify
Phase 3: /orchestrate (parallel: API + UI)
Phase 4: /orchestrate (integration + tests)
```

### Tip 3: Hybrid Approach
```
Planning identifies 5 tasks:
- 2 simple → you implement directly in main mode
- 3 complex → /orchestrate for parallel execution
```

### Tip 4: Research Before Planning
```
Unfamiliar area?
→ deep-research mode first (understand)
→ Then planning mode (strategy)
→ Then orchestrate (execute)
```

---

## Output Style Switching

```bash
/output-style main          # Default: analysis + implementation
/output-style planning      # Research + plan (no code changes)
/output-style brainstorming # Requirement discovery
/output-style deep-research # Comprehensive investigation
/output-style business-panel # Strategic analysis
```

**Combine freely:**
```
brainstorming (discover) → planning (strategize) → main (execute)
deep-research (understand) → planning (plan) → orchestrate (parallel execution)
```

---

## Key Orchestration Principles

### 1. Research → Plan → Execute
Never orchestrate without planning first. Planning mode researches patterns and dependencies, preventing agents from making conflicting assumptions.

### 2. Complete Agent Context
When /orchestrate spawns agents, each receives:
- Files to read for patterns (e.g., "Read auth/middleware.ts for error handling pattern")
- Exact scope boundaries (e.g., "Only modify files in services/, don't touch API routes")
- Dependencies and shared types
- Verification requirements

### 3. Orchestrator Never Implements
The orchestrator coordinates, researches, and delegates. It implements shared dependencies (types, interfaces) before spawning agents, but never implements task code directly.

### 4. Honest Blockers Over Workarounds
All agents report blockers immediately:
- "Cannot proceed: Type `PaymentIntent` not defined. Needs creation first."
- "Blocked: Database schema unclear. Needs clarification on..."

No silent workarounds or assumptions.

### 5. Plan Mode for Safety
Use Plan Mode + planning style for any:
- Multi-file changes (4+)
- Unfamiliar code areas
- Refactoring with side effects
- High-stakes features

---

## Agent Quick Reference

**When to spawn which agent:**

- **code-finder**: "Where is X implemented?" (fast, targeted)
- **code-finder-advanced**: "How does authentication work?" (semantic, relationships)
- **root-cause-analyzer**: "Why is X failing?" (diagnosis only)
- **codebase-research-analyst**: "Map the entire auth architecture" (comprehensive)
- **backend-developer**: Spawn from /orchestrate for API/service tasks
- **frontend-ui-developer**: Spawn from /orchestrate for React/UI tasks
- **implementor**: Spawn from /orchestrate for generic implementation

Main style **automatically decides** when to spawn agents vs. implement directly.

---

## Real-World Example: Payment Integration

**Full workflow from unclear requirements to production:**

```bash
# Discovery Phase
→ /output-style brainstorming
User: "Add payment support"
Claude: 🤔 Which providers? Subscription or one-time? Refunds?
User: Stripe, subscriptions, yes refunds

# Research Phase
→ /output-style deep-research
"Research Stripe subscription patterns and our existing payment handling"
Claude: Deploys 2 parallel agents, synthesizes findings

# Planning Phase
→ Shift+Tab twice (Plan Mode ON)
→ /output-style planning
"Plan Stripe subscription integration with refund support"
Claude: Creates 3-phase plan:
  Phase 1: Stripe types + config (orchestrator does this)
  Phase 2: Backend API + Frontend UI (parallel agents)
  Phase 3: Integration + tests (single agent)

# Execution Phase
→ Review plan → Shift+Tab (exit Plan Mode)
→ /orchestrate
Claude:
  1. Creates shared PaymentIntent type
  2. Spawns backend-developer (API endpoints)
  3. Spawns frontend-ui-developer (payment form)
  4. Both agents complete, report file changes
  5. Spawns implementor (integration tests)

# Finalization
→ /fix-build (if needed)
→ Test manually
→ "It's time to push commits and to update the documentation"
```

**Time saved:** Research (deep-research) + parallel execution (orchestrate) = 5-10x faster than sequential implementation.

---

## Common Mistakes to Avoid

❌ **Orchestrating without planning**
→ Agents lack context, make assumptions, create conflicts

✅ **Plan first, then orchestrate**
→ Agents receive complete context, work independently

---

❌ **Skipping Plan Mode for complex work**
→ Risky, might break working code

✅ **Plan Mode for 4+ files or unfamiliar code**
→ Review strategy before execution

---

❌ **Asking orchestrator to implement**
→ Orchestrator delegates, doesn't implement

✅ **Use main style for direct work**
→ Main style implements or auto-delegates

---

❌ **Vague agent instructions**
→ "Add payment stuff to the backend"

✅ **Specific agent instructions**
→ "Read services/order.ts for patterns, implement payment service in services/payment.ts, use Stripe SDK, handle webhook events"

---

## Agentic Slash Commands

Your configuration includes specialized commands that leverage agents:

### `/diagnose` - Bug Investigation
**When to use:** Complex bugs, unclear root cause

Workflow:
1. Spawns root-cause-analyzer agent
2. Generates 3-5 hypotheses with evidence
3. Presents diagnosis with confidence ratings
4. Offers: Fix now | Plan fix | Need more investigation

**Example:** `/diagnose` "Authentication fails intermittently for mobile users"

---

### `/research` - Deep Codebase Investigation
**When to use:** Need comprehensive understanding of system/feature

Workflow:
1. Automatically switches to deep-research output style
2. Deploys 2-4 parallel research agents based on scope
3. Synthesizes evidence-based findings with confidence ratings
4. Offers: Save report | Plan implementation | Deeper investigation

**Example:** `/research` "Map the authentication architecture and integration points"

---

### `/explore` - Feature Mapping
**When to use:** Understand how a feature works end-to-end

Workflow:
1. Deploys code-finder-advanced agent
2. Traces data flow, identifies all files, maps dependencies
3. Creates visual feature map
4. Auto-saves to `.docs/research/[feature]-map.md`

**Example:** `/explore` "payment processing system"

---

### `/refactor-safe` - Safety-First Refactoring
**When to use:** Multi-module refactor, high risk of breakage

Workflow:
1. **Automatically activates Plan Mode** (critical!)
2. Switches to planning output style
3. Maps all affected code, creates impact analysis
4. Generates phased refactoring plan with rollback points
5. Waits for user approval
6. Executes via /orchestrate with verification at each phase

**Example:** `/refactor-safe` "Refactor user service to repository pattern"

⚠️ This command prioritizes safety above all - Plan Mode prevents accidents

---

### `/document-existing` - Reverse Documentation
**When to use:** Existing code lacks documentation

Workflow:
1. Deploys code-finder-advanced to analyze feature
2. Reads feature-doc.template.md
3. Generates comprehensive documentation from user perspective
4. Saves to `.docs/features/[feature].doc.md`

**Example:** `/document-existing` "notification system"

---

## Traditional Commands

Simple commands (not needing agentic orchestration):

- **`/git`**: "It's time to push commits and to update the documentation"
- **`/fix-build`**: App works but build fails
- **`/save-to-md [path]`**: Save research findings
- **`/orchestrate`**: Complex multi-step implementation (use after planning mode)

---

## Command Selection Guide

| Scenario | Command | Why |
|----------|---------|-----|
| Bug with unclear cause | `/diagnose` | Systematic hypothesis generation |
| Need to understand architecture | `/research` | Parallel deep investigation |
| Map how feature works | `/explore` | End-to-end feature tracing |
| Risky refactor ahead | `/refactor-safe` | Auto Plan Mode + phased execution |
| Undocumented code exists | `/document-existing` | Analysis + template generation |
| Ready to implement complex plan | `/orchestrate` | Parallel agent coordination |
| App works, build fails | `/fix-build` | Type error batch fixing |
| Done with changes | `/git` | Documentation + commit |

---

**Your Setup Philosophy:**
Research-first → Evidence-based → Parallel execution → Honest blockers → Clean separation of concerns