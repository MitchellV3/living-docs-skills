# JSDoc Reference

## Functions

```javascript
/**
 * Brief description of what the function does.
 *
 * @param {string} name - Description of the parameter
 * @param {number} count - Description of the parameter
 * @returns {boolean} Description of the return value
 * @example
 * const result = myFunction("hello", 5);
 */
function myFunction(name, count) {
  // ...
}
```

## Optional and Default Parameters

```javascript
/**
 * @param {string} required - Required parameter
 * @param {string} [optional] - Optional parameter
 * @param {number} [defaultValue=10] - Parameter with default
 */
function withDefaults(required, optional, defaultValue = 10) {
  // ...
}
```

## Classes

```javascript
/**
 * Brief description of the class.
 */
class MyClass {
  /**
   * Create an instance of MyClass.
   *
   * @param {string} name - Instance name
   */
  constructor(name) {
    /** @type {string} */
    this.name = name;
  }

  /**
   * Brief description of the method.
   *
   * @param {number} value - Input value
   * @returns {string} Processed result
   */
  process(value) {
    // ...
  }
}
```

## Async Functions

```javascript
/**
 * Fetches data from the API.
 *
 * @param {string} endpoint - API endpoint path
 * @param {RequestInit} [options] - Fetch options
 * @returns {Promise<Object>} Parsed response data
 * @throws {Error} If the request fails
 */
async function fetchData(endpoint, options) {
  // ...
}
```

## Callbacks

```javascript
/**
 * Processes items with a callback.
 *
 * @param {Array<Object>} items - Items to process
 * @param {(item: Object) => boolean} filter - Filter predicate
 * @returns {Array<Object>} Filtered items
 */
function processItems(items, filter) {
  // ...
}
```

## Types and Interfaces

```javascript
/**
 * @typedef {Object} User
 * @property {string} id - Unique identifier
 * @property {string} name - Display name
 * @property {string} email - Email address
 * @property {Date} createdAt - Account creation date
 */

/**
 * @typedef {Object} Config
 * @property {string} apiUrl - Base API URL
 * @property {number} [timeout=5000] - Request timeout in ms
 * @property {boolean} [debug=false] - Enable debug logging
 */
```

## Modules

```javascript
/**
 * Utility functions for string manipulation.
 *
 * @module stringUtils
 */
```

## Enums / Constant Objects

```javascript
/**
 * Application status codes.
 *
 * @enum {string}
 */
const Status = {
  IDLE: 'idle',
  LOADING: 'loading',
  SUCCESS: 'success',
  ERROR: 'error',
};
```

## TypeScript (via JSDoc)

```javascript
/**
 * @template T
 * @param {Array<T>} items
 * @param {(item: T) => boolean} predicate
 * @returns {T | undefined}
 */
function find(items, predicate) {
  // ...
}
```

## Rules

- Document all exported functions, classes, and types
- Skip trivial getters/setters and single-expression arrow functions
- Document parameters when names are not self-explanatory
- Include `@example` for complex or non-obvious functions
- Use `{@link}` to reference other documented items
