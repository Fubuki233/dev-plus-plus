---
name: ui-review
description: "Generate approval-gated YAML UI stories, then validate approved stories with multi-agent Playwright screenshots using the dev++ agentic UI review workflow. Use when the user invokes /ui-review or asks to run browser QA, acceptance testing, UI story validation, screenshot-based checks, or agentic UI testing from a user direction or ai_review/user_stories/*.yaml."
---

# ui-review

Generate approval-gated UI stories and validate approved stories with browser screenshots using `ui-story-validation` and `playwright-ui-automation`.

Arguments:
- `headed` or `true`: run visible browser windows.
- `vision`: enable screenshot image responses when the browser tool supports it.
- Any other argument can be either a user testing direction or a filename filter.

Defaults:
- Stories directory: `ai_review/user_stories/`
- Story glob: `ai_review/user_stories/*.yaml`
- Screenshots base: `screenshots/ui-review/`

Rules:
- When the user provides a testing direction, first generate as many relevant user stories as practical in the required YAML schema, then stop and request explicit approval.
- Do not treat the first direction-based invocation as approval to open a browser or run tests.
- Treat a later explicit approval to run the generated or discovered stories as approval to start browser UI validation only for those stories.
- Do not install dependencies, start app servers, run unrelated tests/builds, or change git state without separate approval.
- Respect the target repository's own runtime and testing restrictions.
- If no URL is reachable or the app is not running, report the blocker and ask for the correct URL or startup approval.
- If a YAML file cannot be parsed, warn and skip that file; do not abort the full run.
- If no stories are found after filtering, report that and stop.
- Save screenshots under one timestamped run directory.
- Use multi-agent execution after approval when safe subagent tooling is available. Split stories into disjoint batches with separate browser sessions and screenshot directories.
- If multi-agent execution is unavailable, report the blocker and ask whether serial execution is acceptable. Do not silently downgrade.
- Every story result must end with `RESULT: PASS|FAIL | Steps: X/Y`.

Story generation workflow:
1. Parse the user's testing direction, target URL, credentials assumptions, and risk limits.
2. Generate broad but feature-relevant coverage: happy paths, navigation, forms, validation errors, empty/loading/error states, permissions, destructive confirmations, persistence, responsive layout, and important regressions.
3. Output exactly one fenced `yaml` block with this schema:
   ```yaml
   stories:
     - name: "Homepage loads with navigation"
       url: "http://localhost:3000"
       workflow: |
         Navigate to http://localhost:3000
         Verify the homepage loads successfully
         Verify a navigation bar is visible with at least 3 links
         Verify a hero section or main content area is present

     - name: "Login flow completes"
       url: "http://localhost:3000/login"
       workflow: |
         Navigate to http://localhost:3000/login
         Verify the login page loads with email and password fields
         Fill in email with "test@example.com"
         Fill in password with "password123"
         Click the login/submit button
         Verify the page redirects to a dashboard or authenticated view
   ```
4. Ask the user to approve, edit, or reject the proposed stories. Stop before browser execution.

Approved execution workflow:
1. Discover YAML files under `ai_review/user_stories/*.yaml`, or use the stories approved in the conversation.
2. Apply any filename filter after removing `headed`, `true`, and `vision`.
3. Parse each file's or approved block's `stories` array. Each story must have `name`, `url`, and `workflow`.
4. Create a run directory:
   ```bash
   RUN_DIR="screenshots/ui-review/$(date +%Y%m%d_%H%M%S)_$(uuidgen 2>/dev/null | tr '[:upper:]' '[:lower:]' | head -c 6)"
   ```
   If `uuidgen` is unavailable, use the shell PID or another short unique suffix.
5. For each story, create a screenshot directory:
   ```text
   <RUN_DIR>/<source-file-stem>/<story-name-slug>/
   ```
6. Assign disjoint story batches to multiple agents. Give each agent the story name, URL, workflow, headed flag, vision flag, and screenshot directory.
7. Collect every story's `RESULT:` line, step count, screenshot directory, and failure details.
8. Close any browser sessions left open by failed runs.

Report:

```md
# UI Review Test Report

## Summary

- Run: <date time>
- Status: ALL PASSED | PARTIAL FAILURE | ALL FAILED
- Stories: <total> total | <passed> passed | <failed> failed | <skipped> skipped
- Target: <base URL or mixed URLs>
- Screenshots: <RUN_DIR>

## Environment

- Browser mode: headless | headed
- Viewport: <width>x<height>
- Story source: generated from approved direction | ai_review/user_stories/*.yaml
- Agents: <number of agents used and assignment summary>

## Stories

| # | Story | URL | Status | Steps | Screenshots |
| --- | --- | --- | --- | --- | --- |
| 1 | <story> | <url> | PASS | X/Y | <directory> |

## Failures

<For failed stories, include failed step, expected behavior, actual behavior, screenshots, and console/network evidence. Write "None" when all passed.>

## Artifacts

- Screenshots: <RUN_DIR>
- Console logs: <paths or "captured inline only">
- Network notes: <paths or "none">

## Notes

<Coverage gaps, assumptions, blocked stories, or recommended follow-up tests.>
```
