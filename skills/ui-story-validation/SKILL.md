---
name: ui-story-validation
description: "Validate UI user stories and acceptance scenarios in a real browser with step-by-step execution, screenshots, console capture, and structured pass/fail reporting. Use when testing YAML stories, natural-language user stories, acceptance criteria, UI smoke flows, or agentic QA workflows against a running web app."
---

# UI Story Validation

Validate one UI story at a time. Use `playwright-ui-automation` for the browser operations.

## Accepted Inputs

Support these story formats:

- YAML story with `name`, `url`, and `workflow`.
- Simple sentence: `Verify the homepage at http://localhost:3000 shows a hero section.`
- Step list: `Login, navigate to dashboard, verify widgets, open a detail page.`
- Given/When/Then.
- Checklist with assertions.

## Preconditions

- Confirm the target app URL and required credentials or test account setup.
- Respect repository rules for starting apps, running tests, and handling secrets.
- If credentials are needed but unavailable, stop and ask for safe test credentials or a pre-authenticated state file.
- Create screenshot directories outside source artifacts unless the user requests durable fixtures.

## Execution Workflow

1. Parse the story into ordered steps with an explicit expected result for each verification step.
2. Derive a named browser session from the story name.
3. Create a screenshot directory. Use the caller-provided path when available; otherwise use:

```text
screenshots/ui-review/<story-kebab-name>_<short-id>/
```

4. Execute each step sequentially using `playwright-ui-automation`.
5. After every significant step, save a screenshot named with an index and slug, for example `00_login-page.png`.
6. Mark each step `PASS`, `FAIL`, or `SKIPPED`.
7. On first failure:
   - Save a failure screenshot.
   - Capture console errors with `playwright-cli -s=<session> console`.
   - Capture relevant request data if needed with `playwright-cli -s=<session> requests`.
   - Stop executing destructive follow-up steps unless the user requested best-effort continuation.
8. Close the browser session.

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

## Final Report

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
