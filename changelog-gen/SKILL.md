---
name: changelog-gen
description: >
  Autonomous changelog maintainer. Generates and updates CHANGELOG.md using
  Keep a Changelog format with Conventional Commits. Triggers after significant
  changes (features, fixes, breaking changes) or on version tags. Use when
  preparing a release, or when user asks to update the changelog.
---

# Changelog Gen

Autonomously maintain a CHANGELOG.md from git commits and PR metadata.

## When to Update

Trigger on:

- **Significant changes** — new features, bug fixes, breaking changes (same heuristics as `living-docs`)
- **Version tags** — when a new version tag is created or detected
- **Manual request** — user asks to update the changelog

Do NOT trigger on:

- Documentation-only changes
- CI/build config changes
- Internal refactors with no behavior change

## Workflow

### 1. Find the Starting Point

Determine where to start reading commits:

```bash
git describe --tags --abbrev=0 2>/dev/null || echo "NO_TAGS"
```

- **If tag exists**: read all commits since that tag
- **If no tags**: read the last 50 commits as a fallback

### 2. Parse Commits

For each commit, extract:

- **Subject line** — parse conventional commit prefix (`feat:`, `fix:`, etc.)
- **Body** — additional context
- **PR link** — check for `(#123)` suffix or co-authored-by

Map commit types to changelog sections:

| Prefix | Section |
|---|---|
| `feat:` | Added |
| `fix:` | Fixed |
| `perf:`, `refactor:` | Changed |
| `breaking:`, `feat!:` | Changed (note as breaking) |
| `docs:`, `test:`, `chore:`, `ci:`, `build:` | Skip |

### 3. Enrich with PR Data

When a commit is linked to a PR:

1. Use the PR title as the description (cleaner than commit messages)
2. If PR body has a summary, incorporate it
3. Fall back to commit subject if PR metadata is unavailable

### 4. Write Entries

- Group related changes under a single entry
- Write in imperative mood ("Add user auth" not "Added user auth")
- Reference PR/issue numbers: `(#123)`
- Keep entries under 2 lines
- Newest version at top of file

### 5. Suggest Version Bump

Analyze commit types since the last tag:

| Commits include | Suggested bump |
|---|---|
| Only `fix:`, `chore:` | **patch** (0.0.x) |
| Any `feat:` | **minor** (0.x.0) |
| Any `breaking:` or `feat!:` | **major** (x.0.0) |

Present the recommendation with reasoning. Do not commit the version change.

### 6. Create or Update CHANGELOG.md

- If CHANGELOG.md exists → insert new version block under `[Unreleased]`
- If missing → create from the format in the reference file

## Reference

- **Format spec**: See [changelog-format.md](references/changelog-format.md)

Load this reference for the full Keep a Changelog structure, conventional commit mapping, and git log command patterns.
