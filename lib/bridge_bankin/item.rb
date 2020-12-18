# frozen_string_literal: true

module BridgeBankin
  class Item < Resource
    class << self
      def list(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/items", params)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/items/#{id}", params)
        end
      end

      def refresh(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.post("/v2/items/#{id}/refresh", params)
        end
      end

      def refresh_status(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/items/#{id}/refresh/status", params)
        end
      end

      def delete(id:, access_token:)
        protected_resource(access_token) do
          api_client.delete("/v2/items/#{id}")
        end
      end
    end
  end
end
