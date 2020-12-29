# frozen_string_literal: true

module BridgeBankin
  #
  # Connect resource
  #
  class Connect < BridgeObject
    class << self
      include API::Resource

      def connect_item(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/add/url", params)
          convert_to_bridge_object(data)
        end
      end

      def connect_item_with_iban(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/connect/items/add/url", params)
          convert_to_bridge_object(data)
        end
      end

      def edit_item(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/edit/url", params)
          convert_to_bridge_object(data)
        end
      end

      def item_sync(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/sync", params)
          convert_to_bridge_object(data)
        end
      end

      def validate_email(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/users/email/confirmation/url", params)
          convert_to_bridge_object(data)
        end
      end

      def validate_pro_items(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/pro/confirmation/url", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
