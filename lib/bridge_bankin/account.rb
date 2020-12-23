# frozen_string_literal: true

module BridgeBankin
  class Account < BridgeObject
    RESOURCE_TYPE = "account"

    class << self
      include API::Resource

      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts", params)
          convert_to_bridge_object(data)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts/#{id}", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
