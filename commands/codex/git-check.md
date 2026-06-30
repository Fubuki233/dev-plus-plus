---
description: "dev++: inspect git branch, worktree, remotes, and push/commit risk"
argument-hint: "[target remote/branch or scope]"
---

Use $git-change-control to run a read-only git preflight for this target or scope:

`$ARGUMENTS`

Rules:
- Inspect current branch, worktree status, remotes, upstream, recent commits, and relevant diff scope.
- Identify unrelated dirty files, detached HEAD, protected branches, unexpected remotes, and risky commit ranges.
- Do not stage, commit, switch branches, merge, rebase, tag, push, reset, clean, or delete anything.
- Report the exact current state, risks, and the approval needed for any state-changing git action.
