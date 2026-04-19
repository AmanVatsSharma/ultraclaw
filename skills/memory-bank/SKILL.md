# Memory Bank Skill

Persist facts, preferences, and notes across all sessions using SQLite.

## Usage
- "remember: X"
- "what do you know about X"
- "forget X"
- "what have I told you"
- "note that X"

## Behavior
- Store memories with a timestamp and category (preference, fact, note, task)
- On each session start, recall relevant memories for context
- When user asks a question you've been told the answer to before, use memory
- Confirm before deleting memories
- Memory is stored locally at: ~/.openclaw/memory.db
