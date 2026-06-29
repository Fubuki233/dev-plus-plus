---
name: test-and-verify
description: "Use when planning or running tests, lint, type checks, builds, smoke checks, screenshots, manual verification, or CI reproduction in a repository. Guides Codex to discover canonical commands, obey environment restrictions, ask for approval before execution when required, run focused checks first, and report exact verification status without claiming unrun tests passed."
---

# Test And Verify

## Execution Gate

Do not run tests, lint, builds, package installs, servers, migrations, smoke checks, screenshots, or CI reproduction unless the user or project workflow explicitly approves that command class.

`/verify-plan` means propose commands only. It does not approve execution.

## Command Discovery

Discover canonical commands from:

- README, AGENTS, docs, and contribution guides.
- Package scripts, Makefile, task files, pyproject, tox, CI config, Docker files, or scripts directories.
- Project-specific environment restrictions such as Docker-only, pinned toolchains, or no-test-without-approval rules.

Prefer focused checks for touched areas before broad suites.

## Reporting

For every command that runs, report:

- Exact command.
- Working directory.
- Exit status.
- Relevant failure lines or success summary.
- Whether failures appear related to the change, pre-existing, or environmental, based on evidence.

Never claim tests passed unless they actually ran and exited successfully. If checks were not run, say why.

Read `references/verification-report.md` for a compact report template.
