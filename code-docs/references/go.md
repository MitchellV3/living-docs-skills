# Go Documentation Reference

## Comment Conventions

Go comments follow strict rules — they appear **above** the declaration and the first sentence is a summary that begins with the name of the thing being documented.

```go
// Package server provides HTTP handlers for the REST API.
package server

// MyFunc does X.
func MyFunc() {}

// myFunc does X (unexported, no doc required but encouraged).
func myFunc() {}
```

## Package-Level Doc Comments

Place a doc comment directly above the `package` declaration in one `.go` file (typically `doc.go` or `main.go`).

```go
// Package payment handles billing, subscriptions, and invoice generation
// for the platform.
//
// It supports Stripe and PayPal backends and provides a unified
// interface for charging customers.
package payment
```

## Function / Method Doc Comments

Start with the function name. Describe what it does, not how. Mention non-obvious parameters and return values.

```go
// Connect establishes a TCP connection to addr with the given timeout.
// It returns an error if the timeout is exceeded or addr is unreachable.
func Connect(addr string, timeout time.Duration) (net.Conn, error) {
```

```go
// Decode reads the next Message from r and stores it in m.
// It returns io.EOF when no more messages are available.
func (d *Decoder) Decode(m *Message) error {
```

## Type Doc Comments (Structs, Interfaces)

Document the purpose of the type. For structs, describe what it represents. For interfaces, describe the contract.

```go
// Config holds application-level settings loaded from environment
// variables and config files.
type Config struct {
	Addr    string // Listen address, e.g. ":8080".
	Timeout time.Duration
}

// Store defines the persistence layer for user data.
// Implementations must be safe for concurrent use.
type Store interface {
	Get(ctx context.Context, id string) (*User, error)
	Save(ctx context.Context, u *User) error
}
```

## Example Functions

Go uses `_test.go` files for testable examples. Name them `ExampleFunctionName`, `ExampleTypeName`, or `Example_suffix`. The `// Output:` comment makes them runnable as tests.

```go
func ExampleParseURL() {
	u, err := ParseURL("https://example.com/path?q=1")
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println(u.Host)
	// Output: example.com
}

func ExampleDecoder_Decode() {
	d := NewDecoder(strings.NewReader(`{"key":"value"}`))
	var m Message
	d.Decode(&m)
	fmt.Println(m.Key)
	// Output: value
}
```

## godoc Formatting Hints

```go
// Use preformatted indented blocks for code or structured output:
//
//    GET /users/123
//    -> 200 {"name": "Alice"}
//
// Use godoc links to reference other symbols:
//
// See [Config] and [Store.Save] for details.
//
// Use single backtick for inline code or identifiers:
//
// The name must not contain spaces or [Newline] characters.
```

## Rules

- Use **imperative mood** ("Parse reads...", not "Parse will read..." or "Parses...")
- **Skip trivial getters/setters** — `func (c *Config) Addr() string` needs no doc
- **Skip trivial constructors** — `func NewFoo() *Foo { return &Foo{} }` needs no doc
- **Document non-obvious behavior** — side effects, concurrency safety, error conditions
- **First sentence must be a complete summary** ending with a period
- **Keep comments close to the code** — don't repeat the signature verbatim
- **Use `//` comments**, not `/* */` block comments
- **Don't document obvious parameters** — if the name says it, skip the sentence
- **Exported types/functions must always be documented** — unexported is encouraged but not required
- **Link to related symbols** using `[SymbolName]` godoc link syntax (Go 1.19+)
