# frozen_string_literal: true

module BridgeBankin
  #
  # Transaction resource
  #
  class Transaction < BridgeObject
    RESOURCE_TYPE = "transaction"

    class << self
      include API::Resource

      #
      # List all logged in user transactions
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user transactions
      #
      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user updated transactions
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user accounts
      #
      def list_updated(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions/updated", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # Retrieve a single transaction for logged in user
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Transaction] the user accounts
      #
      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transactions/#{id}", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user transactions for a specific account
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user accounts
      #
      def list_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts/#{account_id}/transactions", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user updated transactions for a specific account
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user accounts
      #
      def list_updated_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/accounts/#{account_id}/transactions/updated", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user transactions with a specific IBAN
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user accounts
      #
      def list_by_iban(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/transactions/search", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
