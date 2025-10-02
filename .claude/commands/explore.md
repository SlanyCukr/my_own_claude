---
name: explore
description: Map how a feature or system works across the codebase with visual flow documentation
---

You are conducting a feature exploration to understand how a specific feature or system works end-to-end. Your goal is to create a clear map of the feature's implementation, data flow, and boundaries.

## Core Workflow

### Phase 1: Feature Identification
1. Parse the feature/system name from user input
2. Determine exploration scope:
   - **Feature**: User-facing functionality (forms, workflows, etc.)
   - **System**: Internal mechanism (auth, caching, etc.)
   - **Integration**: Cross-system interaction

### Phase 2: Deploy Code Finder
Deploy code-finder-advanced agent with exploration focus:

```
Task: Map [feature/system name] implementation

Objectives:
1. Identify all files involved in [feature]
2. Trace data flow from start to finish
3. Map dependencies (internal and external)
4. Document entry points and boundaries
5. Identify configuration and setup requirements

Search strategy:
- Find feature entry points (UI triggers, API endpoints, cron jobs)
- Trace execution path through layers
- Identify data transformations
- Map error handling and edge cases
- Check for related utilities and helpers

Output requirements:
- Complete file list with purposes
- Execution flow diagram (textual)
- Data flow from input to output
- Integration points with other systems
```

### Phase 3: Create Feature Map

After agent completes, synthesize findings into a structured map:

```markdown
# Feature Map: [Feature Name]

## Overview
[2-3 sentence description of what feature does]

## Entry Points
- **UI**: [component file:line] - [trigger description]
- **API**: [endpoint file:line] - [HTTP method and path]
- **Background**: [job file:line] - [trigger condition]

## Execution Flow
1. [User action/trigger] → [component:line]
2. [Validation] → [validator:line]
3. [Business logic] → [service:line]
4. [Data persistence] → [repository:line]
5. [Response/update] → [component:line]

## Data Flow
```
Input: [shape/type]
  ↓
[Transformation 1] at [file:line]
  ↓
[Transformation 2] at [file:line]
  ↓
Output: [shape/type]
```

## Files Involved
### Core Implementation
- `[path/to/file.ts]` - [primary responsibility]
- `[path/to/file.ts]` - [secondary responsibility]

### Supporting Code
- `[path/to/util.ts]` - [utility purpose]
- `[path/to/type.ts]` - [types defined]

### Tests (if found)
- `[path/to/test.ts]` - [what's tested]

## Dependencies
### Internal
- [System A]: [how it's used]
- [System B]: [integration point]

### External
- [Library name v1.2.3]: [purpose]

## Configuration
- Environment variables: [list if any]
- Config files: [paths if any]
- Feature flags: [if applicable]

## Error Handling
- [Error scenario] → [handler location:line]
- [Edge case] → [handled at file:line]

## Integration Points
- **Upstream**: [What triggers this feature]
- **Downstream**: [What this feature triggers]
- **Side effects**: [External calls, events emitted, etc.]

## Patterns Used
- [Pattern name]: [where and why]

## Notes
- [Any gotchas or important observations]
- [Areas of technical debt]
- [Opportunities for improvement]
```

### Phase 4: Save Documentation

Automatically save the feature map:

```bash
Save to: .docs/research/[feature-name]-map.md
```

### Phase 5: Offer Next Steps

```
🗺️ Feature map created and saved. Next steps:

Option 1: Modify this feature
  → Switch to planning mode
  → Create implementation plan leveraging this map

Option 2: Document this feature
  → Create user-facing documentation
  → Use /document-existing

Option 3: Explore related feature
  → Map another connected system

Option 4: Review and discuss
  → I can answer questions about this feature
  → Clarify any unclear areas

What would you like to do?
```

## Agent Prompt Template

```
Explore: [feature/system name]

Investigation objectives:
1. Find ALL files involved (no exceptions)
2. Trace complete execution path
3. Document data transformations
4. Map dependencies and integration points

Search approach:
- Start with likely entry points: [UI components/API routes/jobs]
- Follow all imports and function calls
- Check for event handlers and callbacks
- Identify async operations and side effects
- Look for configuration and environment dependencies

Evidence requirements:
- File:line for every claim
- Code snippets for complex logic
- Note any ambiguities or unclear areas

Special focus:
- How does data enter this system?
- What validations/transformations occur?
- Where does data persist or get sent?
- What can go wrong and how is it handled?
- What other systems does this interact with?
```

## Quality Standards

**Completeness**: Map every file involved in the feature
**Clarity**: Flow diagrams should be easy to follow
**Accuracy**: All file:line references verified
**Actionable**: Map enables confident modification
**Documented**: Saved for future reference

## Success Criteria

✅ Every file involved in feature identified
✅ Complete data flow traced from start to finish
✅ All integration points documented
✅ Feature map saved to .docs/research/
✅ User can confidently work with this feature

Remember: A good feature map makes unfamiliar code feel familiar. Be thorough but clear.
