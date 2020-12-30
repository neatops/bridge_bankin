# frozen_string_literal: true

module BridgeBankin
  module API
    #
    # Extend any resource class with API specific methods
    #
    module Resource
      private

      def protected_resource(access_token)
        api_client.access_token = access_token
        yield
      end

      def api_client
        @api_client ||= API::Client.new
      end
    end
  end
end
