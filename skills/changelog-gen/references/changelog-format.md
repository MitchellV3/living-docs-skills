# Changelog Format Reference

## Keep a Changelog Structure

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New feature description

### Changed
- Change to existing functionality

### Deprecated
- Soon-to-be-removed feature

### Removed
- Removed feature

### Fixed
- Bug fix description

### Security
- Vulnerability fix description

## [1.2.0] - 2025-01-15

### Added
- Feature introduced in this version

[Unreleased]: https://github.com/user/repo/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/user/repo/compare/v1.1.0...v1.2.0
```

## Conventional Commits → Changelog Mapping

| Commit prefix | Changelog section | Notes |
|---|---|---|
| `feat:` | Added | New functionality |
| `fix:` | Fixed | Bug fixes |
| `perf:` | Changed | Performance improvements |
| `refactor:` | Changed | Code restructuring (no behavior change) |
| `breaking:` or `feat!:` | Changed + note as breaking | Breaking changes |
| `docs:` | Skip | Documentation-only changes |
| `test:` | Skip | Test-only changes |
| `chore:` | Skip | Maintenance tasks |
| `ci:` | Skip | CI/CD changes |
| `build:` | Skip | Build system changes |
| `revert:` | Fixed | Reverted changes |

## PR Title/Body Enrichment

When a commit is linked to a PR (via merge commit, co-authored-by, or `(#123)` suffix):

1. Use the PR title as the primary description (cleaner than commit message)
2. If PR body contains a summary section, use that for additional context
3. Fall back to commit message if PR metadata is unavailable

## Git Log Commands

### Find last version tag

```bash
git describe --tags --abbrev=0 2>/dev/null || echo "NO_TAGS"
```

### Get commits since last tag

```bash
# With tags
git log <last-tag>..HEAD --pretty=format:"%H|%s|%b" --no-merges

# Without tags (fallback: last 50 commits)
git log -50 --pretty=format:"%H|%s|%b" --no-merges
```

### Check if commit is linked to a PR

```bash
# Look for PR number in commit message
git log --pretty=format:"%H %s" | grep -E '\(#[0-9]+\)'
```

## Version Suggestion Rules

| Commit types since last tag | Suggested bump |
|---|---|
| Only `fix:`, `chore:`, `docs:` | **patch** (0.0.x) |
| Includes `feat:` | **minor** (0.x.0) |
| Includes `breaking:` or `feat!:` | **major** (x.0.0) |

## Entry Writing Rules

- Write in imperative mood ("Add user authentication" not "Added user authentication")
- One entry per change, not per commit (multiple commits may describe one feature)
- Reference issue/PR numbers when available: `(#123)`
- Keep entries under 2 lines
- Group related changes under a single entry
