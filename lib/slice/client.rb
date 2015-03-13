require "uri"
require "slice/resource_based_methods"
require "slice/version"

## Slice::Client
# A class for API client to send HTTP requests.
#
module Slice
  class Client
    DEFAULT_ACCEPT = "application/json"

    DEFAULT_HOST = "api.slice.com"

    DEFAULT_USER_AGENT = "Slice Ruby Gem #{Slice::VERSION}"

    DEFAULT_HEADERS = {
      "Accept" => DEFAULT_ACCEPT,
      "User-Agent" => DEFAULT_USER_AGENT,
    }

    include ResourceBasedMethods

    # ### Slice::Client.new(options = {})
    # Creates a new instance of `Slice::Client` class.
    # `options` can have following key-values:
    #
    # * `access_token` - (String) Access token issued to authenticate and authorize user.
    # * `host` - (String) Hostname where this client accesses to.
    #
    # ```rb
    # Slice::Client.new
    # Slice::Client.new(access_token: "...")
    # ```
    #
    def initialize(access_token: nil, host: nil, ssl: true)
      @access_token = access_token
      @host = host
      @ssl = ssl
    end

    # ### Slice::Client#get(path, params = nil, headers = nil)
    # Sends GET request with given parameters, then returns a `Slice::Response`.
    # `params` are url-encoded and used as URI query string.
    #
    # ```rb
    # client.get("/api/v1/items", page: 2)
    # ```
    #
    def get(path, params = nil, headers = nil)
      process(:get, path, params, headers)
    end

    # ### Slice::Client#post(path, params = nil, headers = nil)
    # Sends POST request with given parameters, then returns a Slice::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.post("/api/v1/items", category: "...", price: "...")
    # ```
    #
    def post(path, params = nil, headers = nil)
      process(:post, path, params, headers)
    end

    # ### Slice::Client#patch(path, params = nil, headers = nil)
    # Sends PATCH request with given parameters, then returns a Slice::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.patch("/api/v1/items/123", title: "...", body: "...")
    # ```
    #
    def patch(path, params = nil, headers = nil)
      process(:patch, path, params, headers)
    end

    # ### Slice::Client#put(path, params = nil, headers = nil)
    # Sends PUT request, then returns a Slice::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.put("/api/v1/items/123")
    # ```
    #
    def put(path, params = nil, headers = nil)
      process(:put, path, params, headers)
    end

    # ### Slice::Client#delete(path, params = nil, headers = nil)
    # Sends DELETE request, then returns a Slice::Response.
    # `params` are url-encoded and used as URI query string.
    #
    # ```rb
    # client.delete("/api/v1/items/123")
    # ```
    #
    def delete(path, params = nil, headers = nil)
      process(:delete, path, params, headers)
    end

    # ### Slice::Client#connection
    # Returns a Faraday::Connection to customize by your favorite middlewares.
    #
    # ```rb
    # client.connection.response :logger
    # ```
    #
    def connection
      @connection ||= Faraday.new(faraday_client_options) do |connection|
        connection.request :json
        connection.response :json
        connection.adapter Faraday.default_adapter
      end
    end

    private

    def default_headers
      headers = DEFAULT_HEADERS.clone
      headers["Authorization"] = "Bearer #{@access_token}" if @access_token
      headers
    end

    def faraday_client_options
      {
        headers: default_headers,
        ssl: {
          verify: @ssl,
        },
        url: url_prefix,
      }
    end

    def host
      @host || DEFAULT_HOST
    end

    def process(request_method, path, params, headers)
      Slice::Response.new(
        connection.send(
          request_method,
          URI.escape(path),
          params,
          headers,
        )
      )
    end

    def url_prefix
      "https://#{host}"
    end
  end
end
