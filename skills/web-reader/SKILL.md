# Web Reader Skill

Read the full text content of any webpage using the built-in browser tool.
No API key required.

## Usage
- "read this page: <url>"
- "what does this article say: <url>"
- "summarize this URL: <url>"
- "get content from <url>"

## Behavior
1. Open browser → navigate to the given URL
2. Extract main content (article body, skip nav/ads/footer)
3. Return clean readable text + page title + URL
4. Summarize if content is very long (>2000 words)

## Combined with web-search
deep-research skill uses web-search + web-reader together:
search → get URLs → read full articles → synthesize report
