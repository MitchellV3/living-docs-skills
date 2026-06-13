---
name: living-docs
description: >
  Autonomous documentation updater for AGENTS.md and README.md. Triggers after
  significant code changes (new features, architectural shifts, dependency changes,
  breaking changes, command changes). Merges updates into existing docs; creates
  from template if files don't exist. Use when making large changes that should be
  reflected in project docs, or when user asks to update AGENTS.md or README.
---

# Living Docs

Autonomously keep AGENTS.md and README.md in sync with the codebase.

## When to Update

Evaluate whether a change is significant before updating. Trigger on:

- **New features** — major functionality added
- **Architectural changes** — new patterns, directory restructuring, design shifts
- **Dependency changes** — notable packages added or removed
- **Breaking changes** — API changes, removed features, migration requirements
- **Command changes** — new or modified build, test, or dev scripts

Do NOT trigger on:

- Bug fixes with no behavioral change
- Typo fixes, formatting, linting
- Internal refactors that don't affect behavior or structure
- Small implementation details

## Workflow

### 1. Analyze Changes

Review what changed. Identify which significance categories apply (architecture, features, deps, breaking, commands).

### 2. Read Existing Docs

Check for AGENTS.md and README.md in the project root.

- If they exist → read current content for merging
- If missing → create from the appropriate template

### 3. Update or Create

**For AGENTS.md**, update sections that reflect the change:

- Architecture → if directory structure or patterns changed
- Dependencies → if packages were added/removed
- Commands → if scripts changed
- Conventions → if new patterns were introduced

**For README.md**, update sections that reflect the change:

- Overview → if project scope or purpose shifted
- Installation → if setup steps changed
- Usage → if new features affect usage
- Recent Changes → append a note about the change

### 4. Merge Rules

- **Preserve** existing content that is still accurate
- **Update** sections where information has changed
- **Add** new sections when the change introduces new concepts
- **Remove** content only when a feature was deleted or a major breaking change makes it obsolete
- **Never** remove project-specific nuance the change doesn't affect

## Reference Templates

- **AGENTS.md structure**: See [agents-template.md](references/agents-template.md)
- **README structure**: See [readme-template.md](references/readme-template.md)

Load the relevant template when creating a file from scratch or verifying section coverage.
