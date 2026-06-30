#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDATOR="${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py"

if [ ! -f "$VALIDATOR" ]; then
  VALIDATOR="$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py"
fi

if [ ! -f "$VALIDATOR" ]; then
  echo "quick_validate.py was not found under CODEX_HOME or ~/.codex." >&2
  exit 1
fi

for skill_dir in "$ROOT_DIR"/skills/*; do
  [ -d "$skill_dir" ] || continue
  echo "Validating $(basename "$skill_dir")"
  python3 "$VALIDATOR" "$skill_dir"
done

for skill_dir in "$ROOT_DIR"/commands/claude-skills/*; do
  [ -d "$skill_dir" ] || continue
  echo "Validating Claude command $(basename "$skill_dir")"
  python3 "$VALIDATOR" "$skill_dir"
done

for prompt_file in "$ROOT_DIR"/commands/codex/*.md; do
  [ -f "$prompt_file" ] || continue
  echo "Validating Codex prompt $(basename "$prompt_file")"
  grep -q '^---$' "$prompt_file"
  grep -q '^description: ' "$prompt_file"
  grep -q '^argument-hint: ' "$prompt_file"
done

echo "All dev++ skills and native commands validated."
