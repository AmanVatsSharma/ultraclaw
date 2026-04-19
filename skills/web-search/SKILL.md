# Web Search Skill

Search the internet for free using the built-in browser tool — no API key required.

## How It Works
Uses the browser tool to navigate DuckDuckGo, extract search results (titles, URLs,
snippets), and return them. Completely free, no rate limits from our side.

## Usage
- "search for X"
- "what is X"
- "find recent news about X"
- "look up X"
- "search the web for X"

## Behavior
1. Open browser → navigate to `https://duckduckgo.com/?q=<query>&ia=web`
2. Extract top 5-10 results: title, URL, snippet
3. For each relevant result, optionally use web-reader skill to get full content
4. Return structured results to the user

## No API Key Needed
This skill uses OpenClaw's built-in browser tool.
Remove BRAVE_API_KEY from .env — it is not required.
