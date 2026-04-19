# File Manager Skill

Read, write, list, move, and delete files on the host filesystem.

## Usage
- "read file X"
- "write X to Y"
- "list files in Z"
- "move X to Y"
- "delete X"
- "what's in folder X"

## Behavior
- Always confirm before deleting or overwriting files
- Use absolute paths when possible to avoid ambiguity
- For large files, summarize content rather than dumping everything
- Respect user's home directory as the default workspace
