# frozen_string_literal: true

module BridgeBankin
  class Transfer < BridgeObject
    RESOURCE_TYPE = "transfert"

    class << self
      include API::Resource

      def send(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/pay/transfer/url", params)
          convert_to_bridge_object(data)
        end
      end

      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers", params)
          convert_to_bridge_object(data)
        end
      end

      def find(uuid:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/#{uuid}", params)
          convert_to_bridge_object(data)
        end
      end

      def list_all_sender_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/senders", params)
          convert_to_bridge_object(data)
        end
      end

      def list_all_receiver_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/receivers", params)
          convert_to_bridge_object(data)
        end
      end

      def list_receiver_accounts_for_sender(sender_account_id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/transfers/accounts/#{sender_account_id}/receivers", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
