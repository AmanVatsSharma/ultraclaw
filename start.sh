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
#   - ANTHROPIC_API_KEY must be set before running
#   - Docker must be running for sandbox/code-runner to work
#   - WhatsApp and Telegram must already be linked (see README)
#
# Author:      Aman
# Last-updated: 2026-04-19

set -e

WORKSPACE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Validate required env vars
if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "ERROR: ANTHROPIC_API_KEY is not set."
  echo "Add it to ~/.bashrc:  export ANTHROPIC_API_KEY=your-key-here"
  exit 1
fi

echo "Starting UltraClaw gateway..."
echo "Workspace: $WORKSPACE_DIR"
echo "Model: anthropic/claude-sonnet-4-6"
echo ""

if [ "$1" = "--quiet" ]; then
  openclaw gateway --port 18789 --workspace "$WORKSPACE_DIR"
else
  openclaw gateway --port 18789 --workspace "$WORKSPACE_DIR" --verbose
fi
