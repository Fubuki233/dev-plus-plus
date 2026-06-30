---
name: git-change-control
description: "Use before or during git operations such as branch changes, staging, commits, tags, rebases, merges, pushes, releases, or deployment handoff. Guides Codex to inspect branch and worktree state, avoid unrelated files and destructive commands, request explicit approval for state-changing git actions, and verify remotes, target branches, and commit scope before push or release."
---

# Git Change Control

## Read-Only Preflight

The `git-check` command wrapper allows only read-only inspection. Codex installs it as `/prompts:git-check`; Claude Code installs it as `/git-check`.

- Current branch.
- `git status --short`.
- Remotes and target branch.
- Recent commits when relevant.
- Files that would be staged or pushed.
- Risks from dirty worktrees, unrelated changes, detached HEAD, protected branches, or unexpected remotes.

## Approval Gate

Never create commits, switch branches, merge, rebase, reset, tag, push, delete branches, or rewrite history without explicit approval for that action.

Do not use destructive commands such as `git reset --hard`, `git checkout -- <file>`, `git clean`, force push, or branch deletion unless the user explicitly asks for that exact operation and the risk has been stated.

## Staging And Commit Rules

1. Stage only files related to the approved task.
2. Do not stage unrelated dirty files, generated artifacts, or other agents' changes.
3. Inspect staged diff before committing.
4. Use the project's commit message conventions.
5. If the project requires a branch, CI skip token, signed commit, or issue key, follow that rule.

## Push And Release Rules

Before push, merge, tag, or release, report and verify:

- Current branch.
- Target remote and branch.
- Commits to be pushed.
- Files included in the commits.
- Whether the target is protected, production, or release-critical.

Ask again if the target or commit range differs from the approved plan.

Read `references/git-preflight.md` for a compact checklist.
