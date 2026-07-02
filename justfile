set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

default:
    @just --list

install:
    scripts/install.sh

install-codex:
    scripts/install.sh --codex-only

install-claude:
    scripts/install.sh --claude-only

install-skills:
    scripts/install.sh --skills-only

install-commands:
    scripts/install.sh --commands-only

validate:
    scripts/validate.sh

ui-review-help:
    @printf '%s\n' 'Codex: /prompts:ui-review [testing-direction|filename-filter] [headed] [vision]'
    @printf '%s\n' 'Claude Code: /ui-review [testing-direction|filename-filter] [headed] [vision]'
    @printf '%s\n' 'Flow: generate stories YAML -> approve -> multi-agent browser validation -> README report'
    @printf '%s\n' 'Stories: ai_review/user_stories/*.yaml'

init-ui-review-stories dest="ai_review/user_stories/example.yaml":
    mkdir -p "$(dirname "{{dest}}")"
    cp templates/ai-review/user_stories/example.yaml "{{dest}}"
    @printf 'Created %s\n' "{{dest}}"
