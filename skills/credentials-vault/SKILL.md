# Credentials Vault

Store and retrieve website login credentials locally.
File: `~/.openclaw/credentials.json` — never committed, never transmitted.

## Usage
- "save my login for github.com: user / pass" → writes to credentials.json
- "log into gmail" → reads credentials.json for gmail.com automatically
- "what sites do I have saved?" → lists domains (passwords masked)
- "delete my credentials for X" → removes entry, confirm first

## File Format
```json
{
  "github.com":     { "username": "aman", "password": "secret" },
  "gmail.com":      { "username": "aman@gmail.com", "password": "secret" },
  "linkedin.com":   { "username": "aman@gmail.com", "password": "secret" }
}
```

## Rules
- Match by domain — "gmail" matches "gmail.com"
- Never display full passwords — always mask as ****
- Confirm before deleting any credential
- File permissions should be 600 (user read/write only)
