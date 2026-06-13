# TSDoc Reference

## Functions

```typescript
/**
 * Brief description of what the function does.
 *
 * @param name - Description of the parameter
 * @param count - Description of the parameter
 * @returns Description of the return value
 * @example
 * const result = myFunction("hello", 5);
 */
function myFunction(name: string, count: number): boolean {
  // ...
}

// Optional and default parameters: use ? for optional, = for defaults
function greet(name: string, greeting?: string): string {
  // ...
}
```

## Classes

```typescript
/** Brief description of the class. */
class MyClass {
  /** Instance name */
  readonly name: string;

  /** Create an instance of MyClass. @param name - Instance name */
  constructor(name: string) {
    this.name = name;
  }

  /** Brief description of the method. @param value - Input value @returns Processed result */
  process(value: number): string {
    // ...
  }
}
```

## Async Functions

```typescript
/**
 * Fetches data from the API.
 * @param endpoint - API endpoint path
 * @param options - Fetch options
 * @returns Parsed response data
 * @throws If the request fails
 */
async function fetchData(endpoint: string, options?: RequestInit): Promise<object> {
  // ...
}
```

## Interfaces

```typescript
/**
 * Represents a user account.
 * @remarks User IDs are UUIDs generated on creation.
 */
interface User {
  /** Unique identifier */
  id: string;
  /** Display name */
  name: string;
  /** Email address */
  email: string;
  /** Account creation date */
  createdAt: Date;
}
```

## Type Aliases

```typescript
/** Configuration options for API client. */
type Config = {
  apiUrl: string;
  timeout?: number;  /** Request timeout in ms (default 5000) */
  debug?: boolean;   /** Enable debug logging */
};

/** Callback invoked when an item is selected. */
type SelectCallback = (item: Item, index: number) => void;
```

## Generic Type Parameters

```typescript
/**
 * Find the first item matching a predicate.
 *
 * @typeParam T - The type of elements in the array
 * @param items - Array to search
 * @param predicate - Test function
 * @returns First matching item, or undefined
 * @example
 * const user = find(users, u => u.id === "123");
 */
function find<T>(items: T[], predicate: (item: T) => boolean): T | undefined {
  // ...
}

/** Application status codes. */
enum Status {
  IDLE = "idle",
  LOADING = "loading",
  SUCCESS = "success",
  ERROR = "error",
}
```

## Module Documentation

```typescript
/**
 * Utility functions for string manipulation.
 * @module stringUtils
 */
```

## When to Use TSDoc vs Type Inference

**Document** when:
- Function purpose isn't obvious from its signature (e.g., `sanitize` vs `escape`)
- Parameters have non-obvious constraints (regex format, valid range)
- Side effects exist (modifies global state, triggers network calls)
- Error conditions are non-obvious
- Generic type parameters need semantic names

**Skip** when:
- The signature is fully self-documenting (e.g., `add(a: number, b: number): number`)
- Trivial getters/setters with obvious behavior
- One-line arrow functions with clear intent
- Properties whose names match their types exactly

## Rules

- Use **imperative mood** for summaries ("Parse the input" not "Parses the input")
- Skip documentation for trivial functions where the signature is self-explanatory
- Document **non-obvious behavior**: side effects, error conditions, performance characteristics
- Use `@example` for complex or non-obvious public APIs
- Use `{@link}` to reference other documented items
- Keep descriptions to 1-2 sentences; put details in `@remarks`
