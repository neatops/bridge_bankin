# frozen_string_literal: true

module BridgeBankin
  #
  # Transfer resource
  #
  class Transfer < BridgeObject
    RESOURCE_TYPE = "transfert"

    class << self
      include API::Resource

      #
      # Request the URL to Bridge's Pay funnel to make a transfer
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the URL to Bridge's Pay funnel
      #
      def send(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/pay/transfer/url", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user transfers
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transfer>] the user's transfers
      #
      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # Retrieve a single transfer for the logged in user
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Transfer] the requested transfer
      #
      def find(uuid:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/#{uuid}", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all sender transfer accounts
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the user accounts
      #
      def list_all_sender_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/senders", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all receiver transfer accounts
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the user accounts
      #
      def list_all_receiver_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/receivers", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all receiver transfer accounts for a specific sender account
      #
      # @param [Integer] sender_account_id the sender_account_id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the user accounts
      #
      def list_receiver_accounts_for_sender(sender_account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/#{sender_account_id}/receivers", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
