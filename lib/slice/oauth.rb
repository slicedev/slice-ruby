require "oauth2"

module Slice
  class OAuth
    def initialize(client_id, client_secret, redirect_url)
      @client_id = client_id
      @client_secret = client_secret
      @redirect_url = redirect_url
    end

    def generate_auth_url
      @client = OAuth2::Client.new(@client_id, @client_secret,
                                   :site => "https://#{Slice::Client::DEFAULT_HOST}")
      @client.auth_code.authorize_url(:redirect_uri => @redirect_url)
    end

    def authenticate! auth_code
      @client.auth_code.get_token(auth_code, :redirect_uri => @redirect_url)
    end
  end
end
