# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Claude Code configuration repository containing custom agents, commands, output styles, hooks, and file templates designed to enhance Claude Code's capabilities for complex software development workflows.

## Architecture

### Core Components

**`.claude/` Directory Structure:**

- **`agents/`** - Custom agent definitions for specialized tasks (frontend-ui-developer, library-docs-writer, etc.)
- **`commands/`** - Slash command implementations for complex workflows
- **`output-styles/`** - Behavior modes (planning, main, deep-research, brainstorming, business-panel)
- **`hooks/`** - TypeScript/shell scripts for tool lifecycle events
- **`file-templates/`** - Templates for documentation and planning artifacts
- **`settings.json`** - Claude Code configuration including permissions and hook registration

### Key Configuration Files

**`settings.json`** - Defines:
- Read permissions (denies node_modules, dist, build, .git, secrets, etc.)
- Hook lifecycle bindings (PreToolUse, Notification, Stop, SubagentStop)
- Status line configuration
- Feature flags

**Hooks Configuration:**
- `validate-read.sh` - Pre-read validation
- `notification.ts` - Notification events
- `stop.ts` - Chat session stop
- `subagent_stop.ts` - Agent completion handling

## Development Workflow

### Output Styles System

The repository implements a multi-mode system where Claude's behavior adapts to task complexity:

- **`main`** - Default mode: moderate research, implements simple code or delegates complex tasks
- **`planning`** - Research-only mode: deep investigation, creates plans without code changes (use with Plan Mode)
- **`deep-research`** - Comprehensive parallel investigation without implementation
- **`brainstorming`** - Requirement discovery and clarification
- **`business-panel`** - Strategic analysis without technical implementation

Switch modes with: `/output-style [mode-name]`

### Specialized Commands

The repository defines agentic slash commands:

**Research & Diagnosis:**
- `/diagnose` - Deploys root-cause-analyzer for systematic bug investigation
- `/research` - Parallel deep investigation of codebase/architecture
- `/explore` - End-to-end feature mapping with data flow tracing

**Implementation:**
- `/orchestrate` - Complex multi-agent parallel execution (use after planning)
- `/refactor-safe` - Auto-activates Plan Mode for safety-first refactoring

**Documentation:**
- `/document-existing` - Generates comprehensive docs from existing code
- `/git` - Documentation updates + commit workflow
- `/save-to-md` - Save research findings to markdown

**Quality:**
- `/fix-build` - Batch type error resolution

### Recommended Workflows

**Complex Feature (4+ files):**
1. Activate Plan Mode (Shift+Tab twice)
2. `/output-style planning`
3. Describe feature - Claude researches with agents
4. Review plan → Exit Plan Mode
5. `/orchestrate` - Parallel implementation

**Bug Investigation:**
1. `/diagnose` with bug description
2. root-cause-analyzer generates hypotheses
3. Review diagnosis
4. Fix directly or `/orchestrate` for complex fixes

**Architecture Understanding:**
1. `/output-style deep-research`
2. "Map [system] architecture"
3. Parallel research agents investigate
4. `/save-to-md .docs/research/[name].md`

## Custom Agents

### Specialized Agent Types

**Frontend:**
- `frontend-ui-developer` - React/Next.js/Tailwind/shadcn/ui implementation with pattern analysis

**Backend:**
- `backend-developer` - API/service/data layer implementation

**Documentation:**
- `library-docs-writer` - Fetches and compresses external library docs

**Research:**
- `code-finder` - Quick code location
- `codebase-research-analyst` - Comprehensive architectural analysis
- `root-cause-analyzer` - Systematic bug diagnosis

**Execution:**
- `implementor` - Receives tasks from orchestrator for parallel execution

### Agent Deployment Patterns

**Never orchestrate without planning** - Planning mode researches patterns/dependencies first

**Orchestrator coordinates, doesn't implement** - Creates shared types/interfaces, then delegates tasks

**Agents report blockers honestly** - No silent workarounds or assumptions

## File Templates

Located in `.claude/file-templates/`:

- `feature-doc.template.md` - User-facing feature documentation structure
- `parallel.template.md` - Parallel task planning template
- `shared.template.md` - Shared context for multi-agent tasks

## Hooks & Permissions

### Security Boundaries

**Read Denials (settings.json):**
- `node_modules/`, `dist/`, `build/` - Build artifacts
- `.git/`, `.env`, `secrets/` - Version control and secrets
- `*.min.js`, `*.map` - Minified/generated files
- `venv/`, `__pycache__` - Python artifacts

### Hook Events

**PreToolUse:** Validates read operations before execution
**Notification:** Triggers on agent events
**Stop:** Executes on chat session end
**SubagentStop:** Handles agent completion

## Key Principles

1. **Research → Plan → Execute** - Never jump to implementation without investigation
2. **Scale-Appropriate Planning** - Simple tasks need simple plans; complex features need deep analysis
3. **Parallel Execution** - Use `/orchestrate` to maximize throughput for multi-component work
4. **Plan Mode for Safety** - Always use Plan Mode (Shift+Tab) for risky refactors or unfamiliar code
5. **Evidence-Based** - All research findings include file:line citations and confidence ratings
6. **Honest Blockers** - Agents report blockers immediately rather than making assumptions

## Documentation Standards

**Feature Docs:** `.docs/features/` - User-facing documentation generated from templates
**Architecture Docs:** `.docs/architecture/` - System design and patterns
**Research Artifacts:** `.docs/research/` - Investigation findings and maps

Template-driven with sections for Overview, User Flows, Data Flow, Implementation, Testing, Security, etc.

## Common Task Patterns

**Small Fix (<3 files):** Use `main` style, implement directly
**Complex Feature:** `planning` → Plan Mode → `/orchestrate`
**Unknown Codebase:** `/research` → `/explore` → `planning` → `/orchestrate`
**Risky Refactor:** `/refactor-safe` (auto Plan Mode + phased execution)
**Bug Diagnosis:** `/diagnose` → Fix or `/orchestrate`
