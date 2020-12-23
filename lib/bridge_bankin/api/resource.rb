# frozen_string_literal: true

module BridgeBankin
  module API
    module Resource
      def protected_resource(access_token)
        api_client.access_token = access_token
        yield
      end

      private

      def api_client
        @api_client ||= API::Client.new
      end
    end
  end
end
