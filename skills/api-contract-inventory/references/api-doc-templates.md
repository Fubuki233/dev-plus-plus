# API Documentation Templates

## User Flow

```md
# <Flow Name>

## Summary
- Role:
- Goal:
- Frontend entry:
- Backend domains:
- Read this when:

## Flow
| Step | User action | Frontend surface | API/client | Backend handler/service | State/side effect | Error handling |
| --- | --- | --- | --- | --- | --- | --- |

## Gaps
| Gap | Impact | Evidence | Proposed owner |
| --- | --- | --- | --- |
```

## Endpoint Inventory

```md
# <Domain> Endpoints

| Method | Path | Purpose | Handler | Auth/permission | Frontend consumers | Tests |
| --- | --- | --- | --- | --- | --- | --- |
```

## Contract Detail

```md
# <Endpoint Or Client Contract>

## Request
- Path params:
- Query params:
- Body:
- Headers:
- Auth:
- Permissions:
- Validation:

## Response
- Success shape:
- Error shape:
- Frontend fields used:

## Reconciliation
- Extra frontend params:
- Missing frontend params:
- Backend ignored params:
- Response fields used but absent:
- Structured errors missing:

## Tests
- Unit:
- Contract/API:
- Permission:
- Frontend/client:
```
