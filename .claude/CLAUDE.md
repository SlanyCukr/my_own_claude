# Global Infrastructure Overview

## Development Guidelines
- Never create documents summarizing your work unless specifically asked to
- If you create temporary scripts to perform work always remove them after you dont need them

## Global Read Policy

- **Default Search-First**: Use `Grep`/code-search before any `Read`.
- **Ranged Read Only**: Read minimal windows around matches (±40 lines or function scope). If not possible, read head/tail windows.
- **Full-File Reads Are Exceptional**: Allowed only when required (e.g., license scan, root config).

## Index → Search → Excerpt Workflow

1. **Index**: Glob folders; count files by type; note likely entry points.
2. **Search**: Batch grep target symbols/configs with `-n -A2 -B2`.
3. **Excerpt**: Read only surrounding ranges (±40 lines).
4. **Plan**: Draft edits and verify targets using grep again.
5. **Apply**: Use `MultiEdit`.
6. **Verify**: Grep changed symbols and run lightweight checks (lint/tests) if available.
