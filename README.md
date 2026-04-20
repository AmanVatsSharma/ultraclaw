# UltraClaw

**Your personal AI agent — powered by Claude or Gemini, running on [OpenClaw](https://github.com/openclaw/openclaw).**

UltraClaw is a self-hosted, multi-channel AI assistant you run on your own machine. Talk to it from your terminal, Telegram, or WhatsApp. It can search the web, execute code, research topics in depth, manage files, and remember things across sessions — all locally, all under your control.

---

## Features

| Capability | Details |
|---|---|
| **Multi-channel** | Terminal, Telegram, WhatsApp (personal number via QR) |
| **Web search** | Browser-based DuckDuckGo search — no API key needed |
| **Web reader** | Reads full content of any URL |
| **Deep research** | Multi-step search → read → synthesize reports |
| **Code execution** | Python & bash in a Docker sandbox |
| **File manager** | Read, write, list, delete files on disk |
| **Memory bank** | Remembers facts across sessions (SQLite) |
| **Voice TTS** | ElevenLabs text-to-speech (optional) |
| **Browser automation** | Click, fill forms, screenshot any page |
| **Cron & webhooks** | Schedule tasks, respond to external events |

---

## Requirements

- Node.js 24+ (not Bun — required for WhatsApp stability)
- Docker (for code execution sandbox)
- An [Anthropic API key](https://console.anthropic.com) with credits, **or** a [Google AI Studio API key](https://aistudio.google.com/apikey) if you prefer Gemini

---

## Quick Start

### 1. Install OpenClaw

```bash
npm install -g openclaw@latest
```

### 2. Clone this repo

```bash
git clone https://github.com/AmanVatsSharma/ultraclaw.git
cd ultraclaw
```

### 3. Set your API key

Copy `.env.example` to `.env` and fill in your key:

```bash
cp .env.example .env
```

Set the key matching the provider you want to use:

```env
# If using Claude (default)
ANTHROPIC_API_KEY=your-anthropic-api-key-here

# If using Gemini instead
GOOGLE_GENERATIVE_AI_API_KEY=your-google-api-key-here

ELEVENLABS_API_KEY=your-elevenlabs-key-here   # optional
```

Then add the same line to your shell profile (`~/.bashrc` or `~/.zshrc`):

```bash
export ANTHROPIC_API_KEY=your-key-here
# or, for Gemini:
export GOOGLE_GENERATIVE_AI_API_KEY=your-key-here
```

### 4. Configure OpenClaw

Claude is the default. To stay on Claude:

```bash
openclaw config set gateway.mode local
openclaw config set agents.defaults.model "anthropic/claude-sonnet-4-6"
```

To use Gemini instead, pick one of:

```bash
openclaw config set agents.defaults.model "google/gemini-2.5-pro"    # highest capability
openclaw config set agents.defaults.model "google/gemini-2.5-flash"  # faster and cheaper
```

Also update `openclaw.json` (the `agent.model` field) to match, so `./start.sh` validates the right API key.

#### Choosing a model

| Model | Strengths | Tradeoffs |
|---|---|---|
| `anthropic/claude-sonnet-4-6` | Default; strong tool use, long context | Paid API, rate-limited on free tier |
| `google/gemini-2.5-pro` | Highest Gemini capability; good for deep research | Higher cost than flash |
| `google/gemini-2.5-flash` | Fast + cheap; good for chat and most tool calls | Less capable on complex reasoning |

### 5. Start the gateway

```bash
./start.sh
```

### 6. Talk to UltraClaw

```bash
openclaw agent --agent main --message "Hello UltraClaw, what can you do?"
```

---

## Channel Setup

### Telegram

```bash
openclaw channels add --channel telegram
openclaw channels login --channel telegram
# Paste your bot token from @BotFather
```

### WhatsApp

```bash
openclaw channels add --channel whatsapp
openclaw channels login --channel whatsapp
# Scan QR code with your phone
```

---

## Project Structure

```
ultraclaw/
├── AGENTS.md              # UltraClaw agent definition
├── SOUL.md                # Agent personality
├── TOOLS.md               # All available tools documented
├── openclaw.json          # OpenClaw configuration
├── start.sh               # Gateway startup script
├── .env.example           # Environment variable template
└── skills/
    ├── web-search/        # DuckDuckGo search via browser
    ├── web-reader/        # Full page content reader
    ├── code-runner/       # Python & bash execution
    ├── deep-research/     # Multi-step research
    ├── file-manager/      # File system operations
    └── memory-bank/       # Persistent memory (SQLite)
```

---

## Example Prompts

```
"Search the web for latest AI news"
"Run this Python script: print('hello world')"
"Research quantum computing in depth"
"Remember: I prefer concise answers"
"Read this article: https://example.com/article"
"List files in my Downloads folder"
"Schedule a reminder every morning at 9am"
```

---

## Security

- Your `.env` file is gitignored — never committed
- Code runs in an isolated Docker sandbox
- WhatsApp uses Web-based auth (no Business API required)
- All data stays on your machine

---

## License

MIT
