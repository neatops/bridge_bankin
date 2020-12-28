# frozen_string_literal: true

module BridgeBankin
  class Item < BridgeObject
    RESOURCE_TYPE = "item"

    # TODO: Add support of item statuses

    class << self
      include API::Resource

      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items", params)
          convert_to_bridge_object(data)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items/#{id}", params)
          convert_to_bridge_object(data)
        end
      end

      def refresh(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/items/#{id}/refresh", params)
          convert_to_bridge_object(data)
        end
      end

      def refresh_status(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items/#{id}/refresh/status", params)
          convert_to_bridge_object(data)
        end
      end

      def delete(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.delete("/v2/items/#{id}", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
