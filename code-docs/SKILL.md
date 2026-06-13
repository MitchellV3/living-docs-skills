---
name: code-docs
description: >
  Autonomous inline documentation updater. Adds jsdoc or language-appropriate
  docstrings to new and modified code. Triggers after code creation or significant
  modifications. Polyglot — detects language and applies the right format. Use when
  adding documentation to functions, classes, or modules, or when user asks to add
  jsdoc or docstrings.
---

# Code Docs

Autonomously add inline documentation to new and modified code.

## When to Update

Document code that was **created or significantly modified** in the current session. Focus on:

- New functions, classes, and modules
- Modified functions with changed behavior, parameters, or return values
- Complex logic (branching, multiple params, non-obvious behavior)

Skip:

- Trivial getters, setters, and single-expression arrow functions
- Code that was only moved or reformatted
- Existing documentation that is still accurate

## Workflow

### 1. Detect Language

Identify the language from the file extension:

| Extension | Language | Format |
|---|---|---|
| `.js`, `.jsx`, `.mjs` | JavaScript | JSDoc |
| `.ts`, `.tsx` | TypeScript | JSDoc / TSDoc |
| `.py` | Python | Google-style docstrings |
| `.rb` | Ruby | YARD |
| `.java` | Java | Javadoc |
| `.go` | Go | GoDoc |
| `.rs` | Rust | `///` doc comments |
| `.php` | PHP | PHPDoc |

For languages not listed, use the most common community convention.

### 2. Load Format Reference

Read the appropriate reference file for the detected language:

| Language | Reference |
|---|---|
| JavaScript | [jsdoc.md](references/jsdoc.md) |
| TypeScript | [typescript.md](references/typescript.md) |
| Python | [python-docstrings.md](references/python-docstrings.md) |
| Go | [go.md](references/go.md) |
| Rust | [rust.md](references/rust.md) |
| Java | [java.md](references/java.md) |

For unlisted languages, follow the most common community convention.

### 3. Document Code

For each new or modified item:

1. Check if documentation already exists — preserve it unless clearly outdated
2. Add or update the doc comment with:
   - Brief description of purpose
   - `@param` tags for each parameter (skip self-explanatory names)
   - `@returns` tag if the function returns a value
   - `@example` for complex or non-obvious functions
   - `@throws` if the function can throw errors
3. Document at the appropriate level — public API gets full docs, internal helpers get brief descriptions

### 4. Quality Rules

- Write in imperative mood ("Fetches data" not "This function fetches data")
- Keep descriptions under 2 sentences
- Match parameter types to actual types in code
- Include `@example` only when the usage is non-obvious
- Use `{@link}` to cross-reference other documented items

## Adding Language Support

To add a new language, create a reference file at `references/<language>.md` following the same structure as `jsdoc.md`. Update the language detection table above to reference it.
