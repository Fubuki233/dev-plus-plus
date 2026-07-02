---
name: ui-story-validation
description: "Generate approval-gated YAML UI stories from a user testing direction, then validate approved UI user stories and acceptance scenarios in a real browser with multi-agent execution, screenshots, console capture, README-style reporting, and structured pass/fail results. Use when testing YAML stories, natural-language user stories, acceptance criteria, UI smoke flows, or agentic QA workflows against a running web app."
---

# UI Story Validation

Generate reviewable UI stories before browser testing, then validate approved stories one at a time. Use `playwright-ui-automation` for browser operations.

## Accepted Inputs

Support these story formats:

- Direction from the user, for example `test checkout`, `optimize UI testing for admin settings`, or `cover quotation editor flows`.
- YAML story with `name`, `url`, and `workflow`.
- Simple sentence: `Verify the homepage at http://localhost:3000 shows a hero section.`
- Step list: `Login, navigate to dashboard, verify widgets, open a detail page.`
- Given/When/Then.
- Checklist with assertions.

## Story Generation And Approval

When the user gives a UI testing direction instead of approved executable stories:

1. Infer as many relevant user stories as practical for that feature, including happy paths, navigation, forms, validation errors, empty/loading/error states, permissions, destructive confirmations, persistence, responsive layout, and important regressions.
2. Prefer feature-specific stories over generic smoke tests. Include generic navigation or login stories only when they are required to reach the feature or are explicitly in scope.
3. Use only this YAML shape:

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

4. Give the stories to the user in one fenced `yaml` block and stop.
5. Ask for explicit approval before browser testing. Do not open browsers, start app servers, install dependencies, run tests, or create screenshots while waiting for approval.
6. If credentials, base URLs, seeded data, or destructive-test limits are missing, list those assumptions next to the YAML and ask for confirmation before execution.

Do not rewrite stories into another schema. Every generated story must have `name`, `url`, and multiline `workflow`.

## Preconditions

- Confirm the target app URL and required credentials or test account setup.
- Respect repository rules for starting apps, running tests, and handling secrets.
- If credentials are needed but unavailable, stop and ask for safe test credentials or a pre-authenticated state file.
- Create screenshot directories outside source artifacts unless the user requests durable fixtures.
- Browser execution requires explicit user approval of the generated or discovered stories.

## Execution Workflow

After the user approves the stories:

1. Split approved stories across multiple agents when subagent tooling is available. Assign disjoint stories or story-file groups, and give each agent its own browser session names and screenshot directories.
2. If safe multi-agent execution is not available, report that blocker and ask whether serial execution is acceptable. Do not silently downgrade.
3. Parse each story into ordered steps with an explicit expected result for each verification step.
4. Derive a named browser session from the story name.
5. Create a screenshot directory. Use the caller-provided path when available; otherwise use:

```text
screenshots/ui-review/<story-kebab-name>_<short-id>/
```

6. Execute each step sequentially using `playwright-ui-automation`.
7. After every significant step, save a screenshot named with an index and slug, for example `00_login-page.png`.
8. Mark each step `PASS`, `FAIL`, or `SKIPPED`.
9. On first failure:
   - Save a failure screenshot.
   - Capture console errors with `playwright-cli -s=<session> console`.
   - Capture relevant request data if needed with `playwright-cli -s=<session> requests`.
   - Stop executing destructive follow-up steps unless the user requested best-effort continuation.
10. Close the browser session.

## YAML Story Schema

```yaml
stories:
  - name: "Login shows dashboard"
    url: "http://localhost:3000/login"
    workflow: |
      Navigate to http://localhost:3000/login
      Fill email with user@example.com
      Fill password with the test password
      Click the login button
      Verify the dashboard page loads
      Verify the user's name is visible
```

## Per-Story Result

Use this exact summary line so orchestrators can parse the result:

```text
RESULT: PASS|FAIL | Steps: <passed>/<total>
```

Then include:

```text
Story: <story name>
URL: <url>
Session: <session name>
Screenshots: <directory>

| # | Step | Status | Screenshot |
| --- | --- | --- | --- |
| 1 | <step> | PASS | 00_step.png |
| 2 | <step> | FAIL | 01_step.png |

Failure Detail:
- Step: <failed step>
- Expected: <expected behavior>
- Actual: <observed behavior>

Console Errors:
<errors or "None captured">
```

Only mark the story `PASS` when every required assertion was verified in the browser.

## README-Style Final Report

After all approved stories finish, produce a Markdown report that can stand alone as a README:

```md
# UI Review Test Report

## Summary

- Run: <date time>
- Status: ALL PASSED | PARTIAL FAILURE | ALL FAILED
- Stories: <total> total | <passed> passed | <failed> failed | <skipped> skipped
- Target: <base URL or mixed URLs>
- Screenshots: <run directory>

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

<For each failed story: failed step, expected behavior, actual behavior, screenshot, console/network evidence. Write "None" when all passed.>

## Artifacts

- Screenshots: <run directory>
- Console logs: <paths or "captured inline only">
- Network notes: <paths or "none">

## Notes

<Coverage gaps, assumptions, blocked stories, or recommended follow-up tests.>
```

Keep the report factual. Do not mark the overall status `ALL PASSED` unless every required assertion passed in the browser.
