module Slice
  module Commands
    class Request < Base
      def call
        response = client.send(
          @arguments.method_name,
          *@arguments.arguments,
          @arguments.params,
          @arguments.headers,
        )
        print ResponseRenderer.new(
          response,
          color: @arguments.color,
          show_body: @arguments.show_body,
          show_header: @arguments.show_header,
        )
      end

      private

      def client
        Client.new(
          access_token: @arguments.access_token,
          host: @arguments.host,
        )
      end
    end
  end
end
