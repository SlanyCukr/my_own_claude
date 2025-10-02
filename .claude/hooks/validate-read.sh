#!/bin/bash

# Hook script to validate Read tool usage
# Uses JSON decision control instead of exit codes

# Parse the tool arguments from stdin
read -r input

# Extract file path, offset, and limit from the tool_input
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
offset=$(echo "$input" | jq -r '.tool_input.offset // 0')
limit=$(echo "$input" | jq -r '.tool_input.limit // empty')

# Check if this is a whole file read (no offset and no limit)
if [[ -z "$offset" || "$offset" -eq 0 ]] && [[ -z "$limit" ]]; then
    # Calculate approximate file size to determine if it's a large file
    if [[ -f "$file_path" ]]; then
        file_size=$(stat -c%s "$file_path" 2>/dev/null || echo 0)

        # If file is larger than 100 lines or 10KB, consider it a whole file read
        line_count=$(wc -l < "$file_path" 2>/dev/null || echo 0)

        if [[ "$line_count" -gt 100 || "$file_size" -gt 10240 ]]; then
            cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Whole file read detected for $file_path ($line_count lines, $file_size bytes).

GLOBAL READ POLICY (CLAUDE.md):
- Default Search-First: Use Grep/code-search before any Read
- Ranged Read Only: Read minimal windows around matches (±40 lines or function scope)
- Full-File Reads Are Exceptional: Allowed only when required (e.g., license scan, root config)

RECOMMENDED WORKFLOW:
1. Index: Glob folders; count files by type; note likely entry points
2. Search: Batch grep target symbols/configs with -n -A2 -B2
3. Excerpt: Read only surrounding ranges (±40 lines)
4. Plan: Draft edits and verify targets using grep again

Please use partial reading with offset and limit parameters to reduce token usage. Example: limit=100 for first 100 lines, or offset=200,limit=100 for lines 200-300."
  }
}
EOF
            exit 0
        fi
    fi
fi

# Allow the read operation
cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow",
    "permissionDecisionReason": "Read operation within acceptable limits"
  }
}
EOF
