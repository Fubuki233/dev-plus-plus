#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}"
CLAUDE_DIR="${CLAUDE_HOME:-$HOME/.claude}"

INSTALL_CODEX_SKILLS=1
INSTALL_CODEX_COMMANDS=1
INSTALL_CLAUDE_COMMANDS=1

usage() {
  cat <<'EOF'
Usage: scripts/install.sh [--codex-only|--claude-only|--skills-only|--commands-only]

Installs dev++ for Codex and Claude Code:
  Codex skills        -> ${CODEX_HOME:-$HOME/.codex}/skills
  Codex prompts       -> ${CODEX_HOME:-$HOME/.codex}/prompts
  Claude Code skills  -> ${CLAUDE_HOME:-$HOME/.claude}/skills

Options:
  --codex-only     Install only Codex skills and prompts.
  --claude-only    Install only Claude Code slash skills.
  --skills-only    Install only reusable Codex skills.
  --commands-only  Install only native command entries.
  -h, --help       Show this help.
EOF
}

for arg in "$@"; do
  case "$arg" in
    --codex-only)
      INSTALL_CLAUDE_COMMANDS=0
      ;;
    --claude-only)
      INSTALL_CODEX_SKILLS=0
      INSTALL_CODEX_COMMANDS=0
      ;;
    --skills-only)
      INSTALL_CODEX_COMMANDS=0
      INSTALL_CLAUDE_COMMANDS=0
      ;;
    --commands-only)
      INSTALL_CODEX_SKILLS=0
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [ "$INSTALL_CODEX_SKILLS" -eq 1 ]; then
  target_dir="$CODEX_DIR/skills"
  mkdir -p "$target_dir"

  for skill_dir in "$ROOT_DIR"/skills/*; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    rm -rf "$target_dir/$skill_name"
    cp -R "$skill_dir" "$target_dir/$skill_name"
    echo "Installed Codex skill $skill_name -> $target_dir/$skill_name"
  done
fi

if [ "$INSTALL_CODEX_COMMANDS" -eq 1 ]; then
  target_dir="$CODEX_DIR/prompts"
  mkdir -p "$target_dir"

  for prompt_file in "$ROOT_DIR"/commands/codex/*.md; do
    [ -f "$prompt_file" ] || continue
    prompt_name="$(basename "$prompt_file")"
    cp "$prompt_file" "$target_dir/$prompt_name"
    echo "Installed Codex prompt $prompt_name -> $target_dir/$prompt_name"
  done
fi

if [ "$INSTALL_CLAUDE_COMMANDS" -eq 1 ]; then
  target_dir="$CLAUDE_DIR/skills"
  mkdir -p "$target_dir"

  for skill_dir in "$ROOT_DIR"/commands/claude-skills/*; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    rm -rf "$target_dir/$skill_name"
    cp -R "$skill_dir" "$target_dir/$skill_name"
    echo "Installed Claude Code slash skill $skill_name -> $target_dir/$skill_name"
  done
fi

echo "Installed dev++."
