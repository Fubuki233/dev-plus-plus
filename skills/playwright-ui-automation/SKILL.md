---
name: playwright-ui-automation
description: "Drive browser automation with Playwright CLI for UI testing, screenshots, browser smoke checks, web scraping, console/network inspection, and repeatable headless or headed browser workflows. Use when an agent needs isolated browser sessions, named Playwright sessions, screenshots, or browser interaction without writing a traditional Playwright test file."
---

# Playwright UI Automation

Use `playwright-cli` as the browser driver. Keep this skill focused on browser capability; use `ui-story-validation` when the task is specifically to validate a user story and report pass/fail results.

## Preconditions

- Confirm `playwright-cli` is available with `command -v playwright-cli`.
- Respect the target repository's runtime and test rules before opening a browser, starting an app, installing dependencies, or running a smoke check.
- If the target app is not already running and no URL is provided, ask for the URL or for approval to start the app using the repository's documented command.
- Never place secrets in prompts, screenshots, logs, or committed files.

## Session Rules

- Always use a named session with `-s=<name>`.
- Derive a short kebab-case session name from the site and task, for example `checkout-flow` or `admin-login`.
- Open sessions with `--persistent` when cookies or local storage should survive across steps.
- Use headless mode by default. Add `--headed` only when the user asks to watch the browser or a visual issue requires it.
- Set a stable viewport at launch:

```bash
PLAYWRIGHT_MCP_VIEWPORT_SIZE=1440x900 playwright-cli -s=<session> open <url> --persistent
```

- For richer visual validation, enable vision only when requested or clearly needed:

```bash
PLAYWRIGHT_MCP_VIEWPORT_SIZE=1440x900 PLAYWRIGHT_MCP_CAPS=vision playwright-cli -s=<session> open <url> --persistent
```

- Always close the named session when finished:

```bash
playwright-cli -s=<session> close
```

## Workflow

1. Open or attach to the named session.
2. Use `snapshot` before interactions to get stable element references.
3. Interact through refs or keyboard actions, not brittle CSS selectors unless no ref is available.
4. Take screenshots after meaningful states, especially before and after navigation, form submission, modal opening, and failure.
5. Inspect `console` and `requests` when behavior fails or the page is blank.
6. Close the session and report the screenshot paths, observed behavior, and any console/network evidence.

## Common Commands

```bash
playwright-cli -s=<session> open <url> --persistent
playwright-cli -s=<session> open <url> --persistent --headed
playwright-cli -s=<session> snapshot
playwright-cli -s=<session> click <ref>
playwright-cli -s=<session> fill <ref> "text"
playwright-cli -s=<session> type "text"
playwright-cli -s=<session> press Enter
playwright-cli -s=<session> screenshot --filename=<path>
playwright-cli -s=<session> console
playwright-cli -s=<session> requests
playwright-cli -s=<session> close
```

## Reporting

Report:

- URL and session name.
- Headless/headed and viewport.
- Screenshots saved.
- Console or network errors if checked.
- Clear PASS/FAIL only when the requested assertion was actually verified.
