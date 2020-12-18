# frozen_string_literal: true

module BridgeBankin
  class Resource
    def initialize(*params); end

    class << self
      def protected_resource(access_token)
        api_client.access_token = access_token
        yield
      end

      private

      def not_implemented_error
        raise "Not implemented"
      end

      def api_client
        @api_client ||= API::Client.new
      end
    end
  end
end
