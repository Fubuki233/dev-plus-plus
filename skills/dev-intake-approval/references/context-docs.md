# AI Context Documentation

Use this structure for durable AI-facing project knowledge when the repository does not already define another location.

```text
docs/ai-context/
  INDEX.md
  docs-map.json
  api/
    INDEX.md
    user-flows/
    endpoints/
    contracts/
    gaps.md
  frontend/
    INDEX.md
    routes.md
    component-inventory.md
    templates/
    error-handling.md
  reuse/
    INDEX.md
    backend-services.md
    frontend-components.md
    domain-patterns.md
  architecture/
    INDEX.md
    module-map.md
    data-flow.md
    permissions.md
```

## Context Size Controls

- Read `docs/ai-context/INDEX.md` first.
- Load only the relevant child `INDEX.md` and 1-3 domain files for the current task.
- Do not read every context document by default.
- Split large inventories by domain. Prefer files under 300-500 lines.
- Add `Read this when` and `Keywords` to each file header.
- Use `rg` for lookup instead of loading entire directories.
- Keep `gaps.md` to current open gaps only. Do not use it as a changelog.

## File Header Template

```md
# <Title>

## Summary
- Covers:
- Read this when:
- Keywords:
- Source areas:
- Related docs:
```
