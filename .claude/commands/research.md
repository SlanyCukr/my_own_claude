---
name: research
description: Deploy parallel research agents for comprehensive codebase understanding with evidence-based findings
---

You are conducting a deep research investigation into a codebase topic. Your goal is to provide comprehensive, evidence-based understanding through systematic parallel research.

## Core Workflow

### Phase 1: Scope Definition
1. Parse the research topic from user input
2. Identify research scope:
   - **Focused**: Single feature/component (1-2 agents)
   - **Moderate**: System/subsystem (2-3 agents)
   - **Comprehensive**: Architecture/cross-cutting (3-4 agents)
3. Automatically switch to deep-research output style

### Phase 2: Parallel Research Deployment

Deploy specialized agents based on research type:

#### For Feature/Component Understanding:
```
Agent 1: code-finder-advanced
Task: Trace [feature] implementation
- Find all files involved
- Map data flow
- Identify entry points and boundaries
- Document patterns used

Agent 2: code-finder-advanced
Task: Analyze [feature] dependencies
- Map all imports and exports
- Identify external library usage
- Find related components
- Check for circular dependencies
```

#### For Architectural Understanding:
```
Agent 1: code-finder-advanced
Task: Map [system] architecture
- Identify major components
- Trace communication patterns
- Document design patterns

Agent 2: codebase-research-analyst
Task: Analyze [system] structure
- Dependency relationships
- Layer separation
- Module boundaries

Agent 3: code-finder-advanced (if needed)
Task: Security/performance analysis
- Identify potential issues
- Check best practices adherence
```

#### For "How Does X Work?" Questions:
```
Agent 1: code-finder-advanced
Task: Trace execution flow for [X]
- Follow code path from trigger to completion
- Document state changes
- Identify side effects

Agent 2: code-finder-advanced
Task: Analyze [X] integration points
- How it connects to other systems
- External API calls
- Database interactions
```

### Phase 3: Evidence Synthesis
After all agents complete:
1. Cross-reference findings from all agents
2. Identify patterns and commonalities
3. Note any contradictions or gaps
4. Build comprehensive understanding with confidence ratings

### Phase 4: Structured Report

Present findings in this format:

```markdown
# Research Report: [Topic]
**Confidence**: [High/Medium/Low]
**Agents Deployed**: [count] parallel streams

## Executive Summary
[2-3 sentences capturing key findings]

## Key Findings
1. **[Finding]** [Confidence: High/Medium/Low]
   - Evidence: [file:line references from agents]
   - Implication: [what this means]

2. **[Finding]** [Confidence: High/Medium/Low]
   - Evidence: [file:line references]
   - Cross-reference: [related findings]

## Architecture/Structure
[Visual or textual map of components]
- Component A: [purpose] (file:line)
- Component B: [purpose] (file:line)
- Relationships: [how they connect]

## Dependencies
- Internal: [list with purposes]
- External: [libraries/services with versions]

## Patterns Identified
- **Pattern Name**: [description] (seen in: files)

## Knowledge Gaps
[What couldn't be determined]
[What would increase confidence]

## Recommended Actions
1. [Next steps based on findings]
2. [Areas needing attention]
```

### Phase 5: Offer Next Steps

```
📊 Research complete. Options:

Option 1: Save report
  → /save-to-md .docs/research/[topic]-analysis.md

Option 2: Proceed to planning
  → Use findings to plan implementation
  → Switch to planning mode

Option 3: Deeper investigation
  → Deploy additional agents for specific areas
  → Focus on [identified gap]

Option 4: Start implementation
  → Proceed with changes based on understanding

What would you like to do?
```

## Research Agent Prompt Template

For code-finder-advanced:
```
Research: [specific aspect of topic]

Focus areas:
- [List 3-5 specific questions to answer]

Requirements:
- Map complete execution paths
- Document with file:line references
- Identify non-obvious patterns
- Note library/framework usage
- Cross-reference related code

Output:
- Structured findings with evidence
- Confidence rating per finding
- Gaps identified
```

For codebase-research-analyst:
```
Analyze: [system/architecture aspect]

Investigation targets:
- Overall structure and organization
- Dependency relationships
- Design pattern usage
- Architectural decisions

Requirements:
- Comprehensive component mapping
- Evidence-based analysis
- Document rationale where visible

Output:
- Architectural overview
- Component interaction map
- Pattern catalog
```

## Quality Standards

**Evidence-Based**: Every claim backed by file:line references
**Confidence-Rated**: Mark findings as High/Medium/Low confidence
**Gap-Honest**: Explicitly state what couldn't be determined
**Cross-Referenced**: Synthesize findings from multiple agents
**Actionable**: Provide clear next steps based on research

## Success Criteria

✅ Comprehensive understanding of research topic
✅ Multiple agents provided consistent findings
✅ Evidence trail for all major claims
✅ Knowledge gaps explicitly identified
✅ User knows what to do next

Remember: Research provides understanding, not solutions. Build complete context before suggesting actions.
