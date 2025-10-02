---
name: document-existing
description: Analyze existing undocumented code and generate comprehensive feature documentation
---

You are creating documentation for existing code that lacks proper documentation. Your goal is to analyze the implementation and generate user-facing documentation that explains how the feature works.

## Core Workflow

### Phase 1: Feature Identification
1. Parse the feature/component name from user input
2. Determine documentation scope:
   - **Feature**: User-facing functionality
   - **System**: Internal mechanism
   - **API**: Endpoint or service interface
   - **Component**: Reusable UI element

### Phase 2: Code Analysis

Deploy code-finder-advanced agent to analyze the feature:

```
Task: Analyze [feature name] for documentation

Objectives:
1. Understand the feature from user perspective
2. Map data flow through the system
3. Identify all files involved
4. Document configuration and setup
5. Find usage examples in codebase

Analysis approach:
- Trace feature from entry point to completion
- Identify user interactions and triggers
- Document data transformations
- Map database operations
- Find error handling and edge cases
- Look for existing tests (they show usage patterns)

Output requirements:
- User perspective: What does this feature do?
- Data flow: How does data move through the system?
- File mapping: Which files implement which parts?
- Configuration: Any environment variables or setup?
- Examples: How is it currently used?
```

### Phase 3: Template-Based Documentation

Read the feature documentation template:

```bash
Read: ~/.claude/file-templates/feature-doc.template.md
```

Create documentation following the template structure:

```markdown
# [Feature Name]

## Overview
[1-2 sentence description from user perspective]
- What problem it solves
- Who uses it
- When it's used

## User Perspective
[How users interact with this feature]
- What they see
- What actions they can take
- What happens as a result

### User Flows
1. **[Flow Name]**: [Description]
   - User action: [what they do]
   - System response: [what happens]
   - Outcome: [result]

2. **[Alternative Flow]**: [Description]
   - [steps...]

## Data Flow
1. [User action initiates...] → [component:line]
2. [Data validation...] → [validator:line]
3. [Business logic...] → [service:line]
4. [Database operation...] → [repository:line]
5. [Response/update...] → [component:line]

### Data Transformations
```typescript
// Input shape
Input: [type/interface]

// Transformation 1 at [file:line]
[what changes]

// Transformation 2 at [file:line]
[what changes]

// Output shape
Output: [type/interface]
```

## Implementation

### Key Files
- `[path/to/file.ts]` - [Primary responsibility]
  - [Key functions/components defined]
  - [Patterns used]

- `[path/to/file.ts]` - [Secondary responsibility]
  - [Supporting logic]

- `[path/to/file.ts]` - [Data layer]
  - [Database operations]

### Database
- **Tables**:
  - `[table_name]` - [purpose and key columns]
  - `[table_name]` - [purpose and key columns]

- **RPC Functions** (if applicable):
  - `[function_name]()` - [what it does]

- **Indexes**: [if relevant for performance]

### External Dependencies
- `[library-name]` - [how it's used]
- `[service-name]` - [integration purpose]

## Configuration
- **Environment Variables**:
  - `[VAR_NAME]` - [description and default]

- **Feature Flags** (if any):
  - `[flag_name]` - [controls what]

- **Setup Requirements**:
  - [Any initial setup needed]

## Usage Examples

### Common Usage
```typescript
// [Description of common scenario]
[code example from actual codebase]
```

### Advanced Usage
```typescript
// [Description of advanced scenario]
[code example showing more complex case]
```

### Edge Cases
- **[Edge case]**: [How it's handled]
- **[Error scenario]**: [Error handling approach]

## Testing
### Manual Testing
1. [Step-by-step test instructions]
2. [What to verify at each step]
3. [Expected behavior]

### Automated Tests (if exist)
- `[test-file.ts]` - [what's tested]
- Coverage: [percentage if available]

## Error Handling
- **[Error type]**: [When it occurs] → [How handled]
- **[Validation error]**: [Trigger condition] → [User feedback]
- **[System error]**: [Failure scenario] → [Recovery approach]

## Performance Considerations
- [Any caching]
- [Query optimization]
- [Rate limiting]
- [Scaling considerations]

## Security
- [Authentication requirements]
- [Authorization checks]
- [Input validation]
- [Data sanitization]

## Related Documentation
- Architecture: `.docs/architecture/[related].md`
- API: `.docs/api/[endpoint].md` (if applicable)
- Related features: [links]

## Known Issues / Technical Debt
- [Issue 1]: [Description and impact]
- [Issue 2]: [Description and workaround]

## Future Improvements
- [Potential enhancement 1]
- [Potential enhancement 2]

## Changelog
- [Date]: Initial documentation created
```

### Phase 4: Save Documentation

Save to appropriate location:

```bash
Save to: .docs/features/[feature-name].doc.md
```

If the feature is an API endpoint, also create API docs:

```bash
Optional: .docs/api/[endpoint-name].md
```

### Phase 5: Quality Review

Review the generated documentation:

```
📝 Documentation Quality Checklist:

✅ User perspective clearly explained
✅ Data flow is complete and accurate
✅ All files referenced with file:line
✅ Configuration requirements documented
✅ Usage examples are practical
✅ Error handling covered
✅ Testing instructions provided

Missing information:
- [List any gaps that need manual verification]
- [Note any assumptions made]
```

### Phase 6: Present to User

```
📚 Documentation created: .docs/features/[feature-name].doc.md

Summary:
- [X] files involved
- [Y] user flows documented
- [Z] configuration items

Quality notes:
- [Any gaps or areas needing verification]
- [Confidence level in documentation accuracy]

Next steps:
1. Review the documentation
2. Fill any gaps identified
3. Consider creating related docs:
   - Architecture doc (if significant)
   - API doc (if public endpoint)
4. Commit: "It's time to push commits and to update the documentation"

Would you like me to create any related documentation?
```

## Documentation Best Practices

**User-First**: Start with user perspective, not implementation
**Evidence-Based**: All file references must be verified
**Actionable**: Someone unfamiliar should be able to work with the feature
**Honest**: Mark areas where information is unclear or assumed
**Maintained**: Date the documentation for freshness tracking

## Agent Prompt Template

```
Analyze: [feature name] for documentation

Investigation goals:
1. Understand user perspective - what does this feature do?
2. Map complete data flow - entry to exit
3. Identify all implementation files
4. Find configuration requirements
5. Locate usage examples

Analysis requirements:
- Start from user entry point (UI, API, etc.)
- Trace execution path completely
- Document data transformations
- Identify error handling
- Find related tests (they show intended usage)
- Check for environment dependencies

Output format:
- User perspective summary
- Complete file list with purposes
- Data flow steps
- Configuration items
- Usage examples from code
- Error handling approaches

Special attention:
- What's the primary use case?
- What edge cases exist?
- Are there security considerations?
- Any performance implications?
```

## Success Criteria

✅ User perspective clearly documented
✅ Complete data flow mapped
✅ All files identified and explained
✅ Usage examples from actual code
✅ Configuration documented
✅ Testing instructions provided
✅ Saved to .docs/features/

Remember: Good documentation bridges the gap between unfamiliar code and confident understanding. Prioritize clarity over comprehensiveness.
