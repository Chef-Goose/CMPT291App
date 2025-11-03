# CMPT291 – Assignment 4 (Tables + Test Data)
**Team:** X01L-Team5

## Files to grade
- `sql/create.sql` – drops & creates all tables, foreign keys, checks, and indexes.
- `sql/insert.sql` – deletes & loads seed data; normalizes out-of-range ratings, then re-enables checks.

## Quick run
**Azure Data Studio / SSMS**
1) Connect to your SQL instance (e.g., `(localdb)\MSSQLLocalDB`).
2) Create/select a DB (e.g., `CMPT291_Team`) and set it active.
3) Run in order: `sql/create.sql` → `sql/insert.sql`.

**sqlcmd (PowerShell)**
```powershell
$DB = "CMPT291_Team"
sqlcmd -S "(localdb)\MSSQLLocalDB" -Q "IF DB_ID('$DB') IS NULL CREATE DATABASE [$DB];"
sqlcmd -S "(localdb)\MSSQLLocalDB" -d $DB -i ".\sql\create.sql"
sqlcmd -S "(localdb)\MSSQLLocalDB" -d $DB -i ".\sql\insert.sql"