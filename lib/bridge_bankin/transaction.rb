# frozen_string_literal: true

module BridgeBankin
  #
  # Transaction resource
  #
  class Transaction < BridgeObject
    RESOURCE_TYPE = "transaction"

    class << self
      include API::Resource

      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions", params)
          convert_to_bridge_object(data)
        end
      end

      def list_updated(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions/updated", params)
          convert_to_bridge_object(data)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions/#{id}", params)
          convert_to_bridge_object(data)
        end
      end

      def list_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts/#{account_id}/transactions", params)
          convert_to_bridge_object(data)
        end
      end

      def list_updated_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts/#{account_id}/transactions/updated", params)
          convert_to_bridge_object(data)
        end
      end

      def list_by_iban(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/transactions/search", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
