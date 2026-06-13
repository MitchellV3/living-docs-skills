# Living Docs Skills

Autonomous documentation skills for AI coding agents. Keeps your project docs, inline comments, and changelogs in sync with your codebase.

## Installing

The [`npx skills add`](https://github.com/vercel-labs/agent-skills) CLI scans the `skills/` folder in this repo, so all skills install the same way.

Install all skills:

```
npx skills add https://github.com/MitchellV3/living-docs-skills
```

Install a single skill by its **install name** (the `name:` field inside the SKILL frontmatter):

```
npx skills add https://github.com/MitchellV3/living-docs-skills --skill "living-docs"
```

## Skills

| Skill folder | Install name | Description |
|---|---|---|
| **living-docs** | `living-docs` | Autonomous documentation updater for AGENTS.md and README.md. Triggers after significant code changes and merges updates into existing docs. |
| **code-docs** | `code-docs` | Autonomous inline documentation updater. Adds jsdoc or language-appropriate docstrings to new and modified code. Polyglot — detects language and applies the right format. |
| **changelog-gen** | `changelog-gen` | Autonomous changelog maintainer. Generates and updates CHANGELOG.md using Keep a Changelog format with Conventional Commits. |

## Which one should I use?

- Start with **living-docs** to keep your project-level docs (AGENTS.md, README.md) up to date.
- Add **code-docs** to automatically document functions, classes, and modules as they're created or modified.
- Add **changelog-gen** when preparing releases or maintaining a changelog from git history.

## License

MIT
