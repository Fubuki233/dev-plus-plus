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

echo "All dev++ skills validated."
