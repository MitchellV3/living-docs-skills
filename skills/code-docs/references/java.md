# Java Documentation Conventions

## Methods

```java
/**
 * Brief description of what the method does.
 *
 * @param name Description of the parameter
 * @param count Description of the parameter
 * @return Description of the return value
 * @throws IllegalArgumentException if count is negative
 */
public String myMethod(String name, int count) {
    // ...
}
```

## Classes and Interfaces

```java
/**
 * Manages user authentication and session lifecycle.
 *
 * <p>This class is thread-safe and can be shared across multiple threads.
 * Sessions expire after 30 minutes of inactivity.</p>
 *
 * @see Session
 * @see UserRepository
 */
public class AuthService { ... }

/**
 * Represents a data transfer object for user profiles.
 */
public interface UserProfile {
    /** Returns the user's display name. */
    String getName();
}
```

## Constructors

```java
/**
 * Creates a new connection to the database.
 *
 * @param host the database server hostname
 * @param port the port number
 * @throws ConnectionException if the host is unreachable
 */
public DatabaseConnection(String host, int port) { ... }
```

## Enums

```java
/** Supported log levels. */
public enum LogLevel {
    /** Verbose output for debugging. */
    DEBUG,
    /** Informational messages. */
    INFO,
    /** Errors that may cause failures. */
    ERROR
}
```

## Package Documentation

Create a `package-info.java` file:

```java
/**
 * Core authentication and authorization services.
 *
 * <p>This package provides the security layer for the application,
 * including user authentication and session management.</p>
 *
 * @see com.example.auth.AuthService
 */
package com.example.auth;
```

## HTML Formatting

```java
/**
 * Processes the input stream and writes to the output.
 *
 * <p>Supports the following formats:</p>
 * <ul>
 *   <li>{@code JSON} - JavaScript Object Notation</li>
 *   <li>{@code XML} - Extensible Markup Language</li>
 * </ul>
 *
 * <p>Note: This method does <b>not</b> close the streams.</p>
 *
 * @param input  the source stream
 * @param output the destination stream
 * @throws IOException if an I/O error occurs
 */
```

## Cross-References

```java
/**
 * Calculates the distance between two geographic points.
 *
 * <p>Uses the Haversine formula. For faster but less accurate results,
 * see {@link #approxDistance}.</p>
 *
 * @param lat1 latitude of the first point
 * @param lon1 longitude of the first point
 * @param lat2 latitude of the second point
 * @param lon2 longitude of the second point
 * @return distance in kilometers
 * @see <a href="https://en.wikipedia.org/wiki/Haversine_formula">Haversine formula</a>
 */
```

## Generics

```java
/**
 * Finds the first element matching the predicate.
 *
 * @param <T> the type of elements in the collection
 * @param collection the collection to search
 * @param predicate the matching criteria
 * @return the first matching element, or {@code null} if none found
 */
public <T> T findFirst(Collection<T> collection, Predicate<T> predicate) { ... }
```

## Rules

- Use imperative mood ("Fetches" not "Fetches the data")
- Document non-obvious behavior, side effects, and thread-safety
- Skip trivial getters/setters unless they have surprising behavior
- Use `{@code}` for inline code references, `{@link}` for Javadoc links
- Always document checked exceptions; document unchecked only if non-obvious
