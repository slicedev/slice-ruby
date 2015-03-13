### Slice::Client.new(options = {})
Creates a new instance of `Slice::Client` class.
`options` can have following key-values:

* `access_token` - (String) Access token issued to authenticate and authorize user.
* `host` - (String) Hostname where this client accesses to.

```rb
Slice::Client.new
Slice::Client.new(access_token: "...")
```

### Slice::Client#get(path, params = nil, headers = nil)
Sends GET request with given parameters, then returns a `Slice::Response`.
`params` are url-encoded and used as URI query string.

```rb
client.get("/api/v1/items", page: 2)
```

### Slice::Client#post(path, params = nil, headers = nil)
Sends POST request with given parameters, then returns a Slice::Response.
`params` are JSON-encoded and used as request body.

```rb
client.post("/api/v1/items", category: "...", price: "...")
```

### Slice::Client#patch(path, params = nil, headers = nil)
Sends PATCH request with given parameters, then returns a Slice::Response.
`params` are JSON-encoded and used as request body.

```rb
client.patch("/api/v1/items/123", title: "...", body: "...")
```

### Slice::Client#put(path, params = nil, headers = nil)
Sends PUT request, then returns a Slice::Response.
`params` are JSON-encoded and used as request body.

```rb
client.put("/api/v1/items/123")
```

### Slice::Client#delete(path, params = nil, headers = nil)
Sends DELETE request, then returns a Slice::Response.
`params` are url-encoded and used as URI query string.

```rb
client.delete("/api/v1/items/123")
```

### Slice::Client#connection
Returns a Faraday::Connection to customize by your favorite middlewares.

```rb
client.connection.response :logger
```

## 'Users' Resources
### Slice::Client#whoami(params = nil, headers = nil)
Get the user object corresponding to the OAuth token

## 'Mailboxes' Resources
### Slice::Client#list_mailboxes(params = nil, headers = nil)
List mailboxes

### Slice::Client#get_mailbox(params = nil, headers = nil)
Get a particular mailbox

## 'Orders' Resources
### Slice::Client#list_orders(params = nil, headers = nil)
List orders

### Slice::Client#create_order(params = nil, headers = nil)
Create a new order

### Slice::Client#get_order(id, params = nil, headers = nil)
Get a particular order

### Slice::Client#update_order(id, params = nil, headers = nil)
Update a particular order

### Slice::Client#delete_order(id, params = nil, headers = nil)
Delete a particular order

## 'Items' Resources
### Slice::Client#list_items(params = nil, headers = nil)
List items

### Slice::Client#create_item(params = nil, headers = nil)
Create a new item

### Slice::Client#get_item(id, params = nil, headers = nil)
Get a particular item

### Slice::Client#update_item(id, params = nil, headers = nil)
Update a particular item

### Slice::Client#delete_item(id, params = nil, headers = nil)
Delete a particular item

## 'Shipments' Resources
### Slice::Client#list_shipments(params = nil, headers = nil)
List shipments

### Slice::Client#create_shipment(params = nil, headers = nil)
Create a new shipment

### Slice::Client#get_shipment(id, params = nil, headers = nil)
Get a particular shipment

### Slice::Client#update_shipment(id, params = nil, headers = nil)
Update a particular shipment

### Slice::Client#delete_shipment(id, params = nil, headers = nil)
Delete a particular shipment

## 'Merchants' Resources
### Slice::Client#get_merchant(id, params = nil, headers = nil)
Get a particular merchant

## 'Recalls' Resources
### Slice::Client#list_recalls(params = nil, headers = nil)
List recalls for the user

### Slice::Client#get_recall(id, params = nil, headers = nil)
Get a particular recall for the user

## 'Email' Resources
### Slice::Client#get_email(id, params = nil, headers = nil)
Get a particular email

### Slice::Client#get_email(id, params = nil, headers = nil)
Get a particular email content

## Dictionary (static) Resources
### Slice::Client#list_categories(params = nil, headers = nil)
List categories of items that a user may have purchased

### Slice::Client#list_providers(params = nil, headers = nil)
List providers of items that a user may have purchased

### Slice::Client#list_purchasetypes(params = nil, headers = nil)
List different types of purchases

### Slice::Client#list_shippers(params = nil, headers = nil)
List shippers that may be used to deliver packages

## 'Action' Resources
### Slice::Client#update(params = nil, headers = nil)
Tell Slice to recrawl the mailboxes of the user

