---
name: ui-review
description: "Validate YAML UI stories with Playwright screenshots using the dev++ agentic UI review workflow. Use when the user invokes /ui-review or asks to run browser QA, acceptance testing, UI story validation, screenshot-based checks, or agentic UI testing from ai_review/user_stories/*.yaml."
---

# ui-review

Validate UI stories from YAML files using `ui-story-validation` and `playwright-ui-automation`.

Arguments:
- `headed` or `true`: run visible browser windows.
- `vision`: enable screenshot image responses when the browser tool supports it.
- Any other argument is a filename filter.

Defaults:
- Stories directory: `ai_review/user_stories/`
- Story glob: `ai_review/user_stories/*.yaml`
- Screenshots base: `screenshots/ui-review/`

Rules:
- Treat invocation of this command as approval to run browser UI validation for the discovered stories, but do not install dependencies, start app servers, run unrelated tests/builds, or change git state without separate approval.
- Respect the target repository's own runtime and testing restrictions.
- If no URL is reachable or the app is not running, report the blocker and ask for the correct URL or startup approval.
- If a YAML file cannot be parsed, warn and skip that file; do not abort the full run.
- If no stories are found after filtering, report that and stop.
- Save screenshots under one timestamped run directory.
- Prefer parallel execution only when safe subagent tooling is available. Otherwise execute stories serially.
- Every story result must end with `RESULT: PASS|FAIL | Steps: X/Y`.

Workflow:
1. Discover YAML files under `ai_review/user_stories/*.yaml`.
2. Apply any filename filter after removing `headed`, `true`, and `vision`.
3. Parse each file's `stories` array. Each story should have `name`, `url`, and `workflow`.
4. Create a run directory:
   ```bash
   RUN_DIR="screenshots/ui-review/$(date +%Y%m%d_%H%M%S)_$(uuidgen 2>/dev/null | tr '[:upper:]' '[:lower:]' | head -c 6)"
   ```
   If `uuidgen` is unavailable, use the shell PID or another short unique suffix.
5. For each story, create a screenshot directory:
   ```text
   <RUN_DIR>/<source-file-stem>/<story-name-slug>/
   ```
6. Run `ui-story-validation` for each story with the story name, URL, workflow, headed flag, vision flag, and screenshot directory.
7. Collect every story's `RESULT:` line, step count, screenshot directory, and failure details.
8. Close any browser sessions left open by failed runs.

Report:

```text
# UI Review Summary

Run: <date time>
Stories: <total> total | <passed> passed | <failed> failed
Status: ALL PASSED | PARTIAL FAILURE | ALL FAILED
Screenshots: <RUN_DIR>

| # | Story | Source File | Status | Steps |
| --- | --- | --- | --- | --- |
| 1 | <story> | <file> | PASS | X/Y |

Failures:
<only include failed story reports>
```
