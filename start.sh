# File:        OpenClaw/start.sh
# Module:      UltraClaw · Startup
# Purpose:     Launch the OpenClaw gateway with all channels active
#
# Usage:
#   ./start.sh           — start gateway in foreground (verbose)
#   ./start.sh --quiet   — start gateway with minimal output
#
# Side-effects:
#   - Starts openclaw gateway on port 18789
#   - Keeps process running; use Ctrl+C or tmux to manage
#
# Key invariants:
#   - The API key matching the provider in openclaw.json must be set
#     (ANTHROPIC_API_KEY for anthropic/*, GOOGLE_GENERATIVE_AI_API_KEY
#     or GOOGLE_API_KEY for google/*)
#   - Docker must be running for sandbox/code-runner to work
#   - WhatsApp and Telegram must already be linked (see README)
#
# Author:      Aman
# Last-updated: 2026-04-20

set -e

WORKSPACE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Read the configured model from openclaw.json (first "model" string value)
MODEL="$(sed -n 's/.*"model"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$WORKSPACE_DIR/openclaw.json" | head -n 1)"

if [ -z "$MODEL" ]; then
  echo "ERROR: could not read agent.model from openclaw.json"
  exit 1
fi

PROVIDER="${MODEL%%/*}"

# Validate required env vars based on the configured provider
case "$PROVIDER" in
  anthropic)
    if [ -z "$ANTHROPIC_API_KEY" ]; then
      echo "ERROR: ANTHROPIC_API_KEY is not set (required for model '$MODEL')."
      echo "Add it to ~/.bashrc:  export ANTHROPIC_API_KEY=your-key-here"
      exit 1
    fi
    ;;
  google)
    if [ -z "$GOOGLE_GENERATIVE_AI_API_KEY" ] && [ -z "$GOOGLE_API_KEY" ]; then
      echo "ERROR: neither GOOGLE_GENERATIVE_AI_API_KEY nor GOOGLE_API_KEY is set (required for model '$MODEL')."
      echo "Add one to ~/.bashrc:  export GOOGLE_GENERATIVE_AI_API_KEY=your-key-here"
      exit 1
    fi
    ;;
  *)
    echo "WARNING: unknown provider '$PROVIDER' in model '$MODEL'."
    echo "Make sure the appropriate API key env var is set for your provider."
    ;;
esac

echo "Starting UltraClaw gateway..."
echo "Workspace: $WORKSPACE_DIR"
echo "Model: $MODEL"
echo ""

if [ "$1" = "--quiet" ]; then
  openclaw gateway --port 18789 --workspace "$WORKSPACE_DIR"
else
  openclaw gateway --port 18789 --workspace "$WORKSPACE_DIR" --verbose
fi
