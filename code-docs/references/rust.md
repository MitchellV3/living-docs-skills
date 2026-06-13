# Rust Documentation Reference

## Functions

```rust
/// Brief description of what the function does.
///
/// # Arguments
///
/// * `name` - Description of the parameter
/// * `count` - Description of the parameter
///
/// # Returns
///
/// Description of the return value.
pub fn my_function(name: &str, count: usize) -> bool {
    // ...
}
```

## Structs

```rust
/// Brief description of the struct.
pub struct User {
    /// Unique identifier.
    pub id: String,
    /// Display name.
    pub name: String,
}
```

## Enums

```rust
/// Application status codes.
pub enum Status {
    Idle,
    Loading,
    Success(String),
}
```

## Traits

```rust
/// A trait for types that can serialize themselves.
pub trait Serializable {
    /// Serialize this value to a string representation.
    fn serialize(&self) -> String;
}
```

## Module Documentation

```rust
//! Utility functions for string manipulation.
//!
//! This module provides helper methods for common string
//! operations including validation, transformation, and parsing.
```

## Examples

```rust
/// Reverses the characters in a string.
///
/// # Examples
///
/// ```
/// use my_crate::reverse;
///
/// assert_eq!(reverse("hello"), "olleh");
/// assert_eq!(reverse(""), "");
/// ```
pub fn reverse(s: &str) -> String {
    s.chars().rev().collect()
}
```

## Safety

```rust
/// Reads a value from a raw pointer.
///
/// # Safety
///
/// * The pointer must be valid and properly aligned.
/// * The pointer must point to a properly initialized value of type `T`.
/// * The caller must ensure no other reference to this data exists.
pub unsafe fn read_from_ptr<T>(ptr: *const T) -> T {
    ptr.read()
}
```

## Panics

```rust
/// Returns the first element of a slice.
///
/// # Panics
///
/// Panics if the slice is empty.
pub fn first<T>(slice: &[T]) -> &T {
    &slice[0]
}
```

## Errors

```rust
/// Parses a configuration string into a `Config`.
///
/// # Errors
///
/// Returns [`ConfigError::InvalidFormat`] if the string does not
/// match the expected `key=value` format.
///
/// Returns [`ConfigError::UnknownKey`] if an unrecognized key is found.
pub fn parse_config(s: &str) -> Result<Config, ConfigError> {
    // ...
}
```

## Intra-doc Links

```rust
/// Parse input using the algorithm described in [`Algorithm`].
///
/// See also [`Config::default`] for default settings and
/// [`Error::new`] for error construction.
pub fn parse(input: &str, config: &Config) -> Result<Output, Error> {
    // ...
}
```

## Rules

- Use `///` for item-level docs (functions, structs, enums, traits)
- Use `//!` for module and crate-level documentation
- Start doc comments in imperative mood: "Return the value" not "Returns the value"
- Document non-obvious behavior, side effects, and safety invariants
- Skip trivial derived methods (getters, setters, constructors with obvious signatures)
- Include `# Examples` for public APIs with non-obvious usage
- Include `# Safety` for every `unsafe` function or trait
- Include `# Panics` when a function can panic on invalid input
- Include `# Errors` for functions returning `Result`, listing all error variants
- Use `[`TypeName`]` for intra-doc links to other items in the codebase
- Use `# Arguments` when parameter names are not self-explanatory
