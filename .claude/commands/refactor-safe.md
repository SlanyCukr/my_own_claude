---
name: refactor-safe
description: Safety-first refactoring with automatic Plan Mode and phased execution strategy
---

You are conducting a safety-first refactoring workflow. Your goal is to ensure no breaking changes through comprehensive planning, Plan Mode review, and phased execution.

## Core Safety Principles

1. **Plan Mode ALWAYS**: Automatically activate Plan Mode before any planning
2. **Research First**: Map all affected code before planning changes
3. **Phased Execution**: Break refactoring into safe, testable phases
4. **Rollback Points**: Ensure each phase can be independently verified
5. **User Approval**: Never execute without explicit approval

## Core Workflow

### Phase 1: Safety Activation
```
🔒 SAFETY MODE ACTIVATED
- Plan Mode: ON (no code changes until approved)
- Output Style: planning (research + strategy)
- Approach: Conservative, evidence-based
```

Explicitly inform user:
```
This refactoring will proceed with maximum safety:
✅ Plan Mode prevents accidental changes
✅ Comprehensive research before planning
✅ Phased execution with verification points
✅ Your approval required before any code changes
```

### Phase 2: Impact Analysis

Deploy research agents to map the refactoring scope:

```
Agent 1: code-finder-advanced
Task: Find all code affected by [refactoring target]
- Direct usages
- Indirect dependencies
- Type dependencies
- Import chains
- Test coverage

Agent 2: code-finder (parallel)
Task: Search for [target pattern variations]
- Alternative names
- Similar implementations
- Related utilities
```

Create an impact map:
```markdown
## Refactoring Impact Analysis

### Direct Impact (will be modified)
- [file:line] - [description]
- [file:line] - [description]
Total: [X] files

### Indirect Impact (depends on changes)
- [file:line] - [how it's affected]
- [file:line] - [how it's affected]
Total: [Y] files

### Risk Assessment
- **Breaking change risk**: [High/Medium/Low]
- **Test coverage**: [X%] of affected code
- **Circular dependencies**: [count if any]
- **External API changes**: [Yes/No]

### Migration Complexity
- **Simple**: [list simpler changes]
- **Complex**: [list complex changes]
- **Requires manual intervention**: [if any]
```

### Phase 3: Phased Refactoring Plan

Create a multi-phase plan with safety checkpoints:

```markdown
## Phased Refactoring Plan: [Refactoring Name]

### Phase 1: Foundation (Sequential - must complete first)
**Goal**: Establish new patterns without breaking existing code

Tasks:
1. Create new types/interfaces (implementor agent)
   - Files: [list]
   - Scope: Add new, don't modify existing

2. Create new implementation alongside old (implementor agent)
   - Files: [list]
   - Scope: Parallel implementation, no changes to existing

**Verification**:
- Type check all new files
- Ensure existing code still works
- No breaking changes yet

**Rollback**: Delete new files if issues found

---

### Phase 2: Gradual Migration (Parallel - safe to do simultaneously)
**Goal**: Migrate independent modules to new pattern

Tasks:
1. Migrate module A (implementor agent)
   - Files: [list]
   - Scope: Switch to new implementation
   - Preserves: Existing interface

2. Migrate module B (implementor agent)
   - Files: [list]
   - Scope: Switch to new implementation
   - Independence: No shared state with module A

3. Migrate module C (implementor agent)
   - Files: [list]
   - Scope: Switch to new implementation
   - Independence: No dependencies on A or B

**Verification**:
- Type check each migrated module
- Run tests for each module
- Verify integration points unchanged

**Rollback**: Revert individual modules independently

---

### Phase 3: Integration & Cleanup (Sequential - after Phase 2)
**Goal**: Remove old implementation, finalize migration

Tasks:
1. Remove old implementation (implementor agent)
   - Files: [list]
   - Verify: No remaining references

2. Update tests (implementor agent)
   - Update test patterns
   - Add new test coverage

3. Update documentation
   - Architecture docs
   - CLAUDE.md if needed

**Verification**:
- Full type check
- All tests passing
- No deprecation warnings

**Rollback**: Phase 3 can be postponed if issues found

---

### Dependencies Between Phases
- Phase 2 REQUIRES Phase 1 completion
- Phase 3 REQUIRES Phase 2 completion
- Within Phase 2, all tasks are independent
```

### Phase 4: Risk Assessment & User Review

Present comprehensive risk analysis:

```
⚠️ REFACTORING RISK ASSESSMENT

**Scope**: [X] files directly modified, [Y] files indirectly affected

**Breaking Change Risk**: [High/Medium/Low]
- [Specific risks identified]

**Mitigation Strategy**:
- [How each risk is addressed]

**Estimated Effort**: [time estimate per phase]

**Rollback Plan**:
- Phase 1: [rollback approach]
- Phase 2: [rollback approach]
- Phase 3: [rollback approach]

**Success Metrics**:
- All type checks pass
- [Specific functionality] still works
- No performance regression

---

👀 PLAN READY FOR REVIEW

This plan was created in Plan Mode - no code has been changed yet.

Options:
1. ✅ Approve and execute → I'll proceed with Phase 1
2. 📝 Modify plan → Tell me what to adjust
3. ❌ Cancel → No changes will be made
4. 🤔 Discuss → Ask questions about the approach

What would you like to do?
```

### Phase 5: Phased Execution (Only after approval)

After user approves, exit Plan Mode and execute:

```bash
User approves → Exiting Plan Mode

Starting Phase 1: Foundation
→ /orchestrate (Phase 1 tasks)
[Wait for completion]

✅ Phase 1 Complete
Verification:
- Type check: [result]
- Existing code: [still works]

Proceed to Phase 2? (Y/n)

Starting Phase 2: Gradual Migration
→ /orchestrate (Phase 2 parallel tasks)
[Wait for completion]

✅ Phase 2 Complete
Verification:
- Module A: [result]
- Module B: [result]
- Module C: [result]

Proceed to Phase 3? (Y/n)

Starting Phase 3: Integration & Cleanup
→ /orchestrate (Phase 3 tasks)
[Wait for completion]

✅ Phase 3 Complete

Final Verification:
→ /fix-build (if needed)
→ Run tests
→ Manual smoke testing

All phases complete! Ready to commit?
→ "It's time to push commits and to update the documentation"
```

## Safety Checklist

Before executing any phase:
- [ ] Plan Mode was used during planning
- [ ] All affected code mapped with evidence
- [ ] Phased plan created with rollback points
- [ ] User approved the plan
- [ ] Previous phase verification passed

During execution:
- [ ] Only execute approved phase
- [ ] Verify each phase before proceeding
- [ ] Stop immediately if blockers encountered
- [ ] Report issues before attempting workarounds

## Agent Communication Template

For each phase's implementor agents:

```
Task: [Phase name] - [Specific task]

Context:
- This is part of a phased refactoring
- Phase: [X of Y]
- Scope: [exact boundaries]

Files to read for patterns:
- [list with reasoning]

Files to modify:
- [list with specific changes]

DO NOT MODIFY:
- [list with reasoning]

Verification requirements:
- Type check your modified files
- Ensure [specific functionality] unchanged
- Report any issues immediately, no workarounds

Success criteria:
- [Specific outcomes]

Report format:
- Changes made: [file:line list]
- Patterns followed: [references]
- Verification: [results]
- Blockers: [if any, stop immediately]
```

## Success Criteria

✅ Plan Mode used throughout planning
✅ Complete impact analysis performed
✅ Phased plan created with safety checkpoints
✅ User approved plan before execution
✅ Each phase verified before proceeding
✅ All type checks pass
✅ Existing functionality preserved
✅ Documentation updated

Remember: Refactoring is high-stakes surgery on working code. Safety over speed, always.
