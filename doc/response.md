### Slice::Response#body
Returns response body returned from API as a `Hash` or an `Array` of `Hash`.

```rb
response.body #=> { ... }
```

### Slice::Response#first_page_url
Returns first page URL or nil.

### Slice::Response#last_page_url
Returns last page URL or nil.

### Slice::Response#next_page_url
Returns next page URL or nil.

### Slice::Response#previous_page_url
Returns previous page URL or nil.

### Slice::Response#headers
Returns response headers returned from API as a `Hash`.

```rb
response.headers #=> { "Content-Type" => "application/json" }
```

### Slice::Response#status
Returns response status code returned from API as a `Fixnum`.

```rb
response.status #=> 200
```

