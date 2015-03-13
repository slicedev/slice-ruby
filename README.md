# slice-ruby

A Ruby interface to the Slice API

## Quick start

Install via Rubygems

`gem install slice-ruby`

... or add to your Gemfile

`gem "slice-ruby", "~> 0.0.1"`

## Sample Usage

```ruby
require 'slice'

oauth = Slice::OAuth.new(client_id, client_secret, redirect_url)
auth_url = oauth.generate_auth_url

access_token = oauth.authenticate! auth_code

client = Slice::Client.new(access_token: access_token.token)
client.list_items
client.list_orders
client.create_order(orderTitle: 'Your Amazon.com order', ...)
client.get_order(123)
client.update_order(123, orderTotal: 395, ...)
client.list_items(limit: 3, offset: 10)
client.list_items(limit: 3, offset: 10).status
client.list_items(limit: 3, offset: 10).headers
client.list_items(limit: 3, offset: 10).body
```

See [doc/client.md](doc/client.md) for more details

Also, note that `access_token` is a `OAuth2::AccessToken` object from [intridea/oauth2](https://github.com/intridea/oauth2), so you can call methods on it such as `access_token.expired?` and `access_token.refresh!`

## CLI Usage

You can use the `slice` executable to call `Slice::Client`'s methods.

```
$ slice <method> <arguments> [headers|params] [options]
           |          |          |      |         |
           |          |          |      |         `-- -H, --host
           |          |          |      |             -a, --access-token
           |          |          |      |             -c, --color
           |          |          |      |             -h, --help
           |          |          |      |                 --header
           |          |          |      |                 --no-body
           |          |          |      |
           |          |          |      `------------ key=value or key:=value
           |          |          |
           |          |          `------------------- Key:value
           |          |
           |          `------------------------------ required arguments for the method
           |
           `----------------------------------------- method name


$ slice list_orders
$ slice list_merchants
$ slice list_orders limit=3 offset=2

```

### Method and Arguments

Pass [Slice::Client's method name](doc/client.md) and required arguments.

### Access token

Accepts access token via `-a, --access-token` or `SLICE_ACCESS_TOKEN` environment variable.

### Headers

To set custom request headers, use `Key:value` syntax.

```
$ slice list_items "Authorization:Bearer 1234567890abcdef1234567890abcdef"
```

### Params

Params are used for query string in the GET method, or for request body in other methods.
You can set params by `key=value` or `key:=value` syntax.
`key=value` is parsed into its String value, while `key:=value` is parsed into its JSON value (e.g. key:=17 will be `{"key":17}`).
The `slice` executable also accepts params via STDIN.

```
$ slice list_items page=2 per_page=10
$ slice create_item < params.json
```

![](images/cli.png)

## Acknowledgements

A good chunk of the code has been shamelessly taken from [increments/qiita-rb](https://github.com/increments/qiita-rb).
