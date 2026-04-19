# Code Runner Skill

Execute Python and bash scripts in an isolated Docker sandbox.

## Requirements
- Docker must be running on the host machine

## Usage
- "run this code: ..."
- "execute this Python script"
- "test this function"
- "what does this bash command do" → then run it

## Behavior
- Always runs code in Docker sandbox — safe for untrusted or experimental code
- Captures stdout, stderr, and exit code
- Returns full output to the user
- Supports Python 3, bash, and common data science libraries
- Confirm before running code that modifies the host filesystem
