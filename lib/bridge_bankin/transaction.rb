# frozen_string_literal: true

module BridgeBankin
  class Transaction < Resource
    class << self
      def list(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transactions", params)
        end
      end

      def list_updated(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transactions/updated", params)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transactions/#{id}", params)
        end
      end

      def list_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/accounts/#{account_id}/transactions", params)
        end
      end

      def list_updated_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/accounts/#{account_id}/transactions/updated", params)
        end
      end

      def list_by_iban(access_token:, **params)
        protected_resource(access_token) do
          api_client.post("/v2/transactions/search", params)
        end
      end
    end
  end
end
