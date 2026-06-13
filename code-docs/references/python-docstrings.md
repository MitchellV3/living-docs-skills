# Python Docstring Reference (Google Style)

## Module Docstrings

```python
"""Utilities for parsing configuration files.

This module provides functions to load, validate, and merge
YAML and JSON configuration files.
"""
```

## Function Docstrings

```python
def connect(url: str, timeout: int = 30) -> Connection:
    """Establish a connection to the remote server.

    Args:
        url: The server URL to connect to.
        timeout: Connection timeout in seconds.

    Returns:
        An active Connection instance.

    Raises:
        ConnectionError: If the server is unreachable.
        ValueError: If the URL format is invalid.
    """
```

## Methods

```python
def process(self, data: list[dict], dry_run: bool = False) -> Result:
    """Process the input data through the pipeline.

    Args:
        data: List of records to process. Each record must
            have at least an 'id' key.
        dry_run: If True, validate without persisting changes.

    Returns:
        A Result object with success count and errors.

    Raises:
        ValidationError: If any record is missing required fields.
    """
```

## One-Liner Docstrings

```python
def is_valid(value: str) -> bool:
    """Return True if value matches the allowed pattern."""
```

## Class Docstrings

```python
class User:
    """A registered user in the system.

    Attributes:
        id: Unique identifier for the user.
        name: Display name shown in the UI.
        email: User's primary email address.
        role: Permission level (admin, editor, viewer).
    """

    def __init__(self, id: str, name: str, email: str, role: str = "viewer"):
        self.id = id
        self.name = name
        self.email = email
        self.role = role
```

## Type Hints vs Docstring Types

Prefer type hints on the signature. Use docstring Args only for description:

```python
# GOOD: type hints on signature, description in docstring
def fetch(url: str, retries: int = 3) -> bytes:
    """Fetch a URL with automatic retry logic.

    Args:
        url: The URL to fetch.
        retries: Number of retry attempts before failing.

    Returns:
        The response body as bytes.
    """
```

```python
# AVOID: redundant type in docstring when hints exist
def fetch(url: str, retries: int = 3) -> bytes:
    """Fetch a URL with automatic retry logic.

    Args:
        url (str): The URL to fetch.  # redundant
    """
```

Use docstring types only when type hints are absent (e.g., dynamic Python, legacy code).

## Multi-Line Args

When a description wraps, indent continuation lines by 4 spaces:

```python
def deploy(service: str, version: str, config: dict[str, str]) -> None:
    """Deploy a new version of the service.

    Args:
        service: Name of the service to deploy.
        version: Semantic version tag (e.g. '1.2.3').
        config: Key-value pairs for environment variables
            injected into the deployment container.
    """
```

## Classmethods and Staticmethods

```python
class Parser:
    @classmethod
    def from_file(cls, path: str) -> "Parser":
        """Create a Parser instance from a config file.

        Args:
            path: Path to the YAML configuration file.

        Returns:
            A Parser configured from the file contents.
        """
        ...

    @staticmethod
    def is_valid_config(data: dict) -> bool:
        """Return True if data contains all required config keys."""
        ...
```

## Rules

- Use imperative mood ("Return", not "Returns")
- Document all public functions, classes, and methods
- Skip trivial getters, setters, and dunder methods (except `__init__`)
- Always document `__init__` Args (even if body is just assignments)
- Use Raises only when the function can actually raise
- Document non-obvious behavior, side effects, and threading concerns
- Keep docstrings under 5 lines; link to external docs for complex APIs
