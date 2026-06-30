---
description: "dev++: propose verification commands without running them"
argument-hint: "[scope, files, or change summary]"
---

Use $test-and-verify to prepare a verification plan for this scope:

`$ARGUMENTS`

Rules:
- Discover canonical commands from README, AGENTS, contribution docs, package scripts, Makefile/task files, CI config, Docker files, and scripts directories.
- Respect project restrictions such as Docker-only workflows, pinned tools, and no-test-without-approval rules.
- Prefer focused checks before broad suites.
- Do not run tests, lint, builds, servers, package installs, screenshots, smoke checks, or CI reproduction.
- Output exact proposed commands, working directories, expected coverage, cost/risk, and what approval would be needed to run them.
