# frozen_string_literal: true

module BridgeBankin
  class Connect < Resource
    class << self
      def connect_item(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/connect/items/add/url", params)
        end
      end

      def connect_item_with_iban(access_token:, **params)
        protected_resource(access_token) do
          api_client.post("/v2/connect/items/add/url", params)
        end
      end

      def edit_item(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/connect/items/edit/url", params)
        end
      end

      def item_sync(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/connect/items/sync", params)
        end
      end

      def validate_email(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/connect/users/email/confirmation/url", params)
        end
      end

      def validate_pro_items(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/connect/items/pro/confirmation/url", params)
        end
      end
    end
  end
end
