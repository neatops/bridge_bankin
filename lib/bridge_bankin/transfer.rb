# frozen_string_literal: true

module BridgeBankin
  class Transfer < Resource
    class << self
      def send(access_token:, **params)
        protected_resource(access_token) do
          api_client.post("/v2/pay/transfer/url", params)
        end
      end

      def list(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transfers", params)
        end
      end

      def find(uuid:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transfers/#{uuid}", params)
        end
      end

      def list_all_sender_accounts(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transfers/accounts/senders", params)
        end
      end

      def list_all_receiver_accounts(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transfers/accounts/receivers", params)
        end
      end

      def list_receiver_accounts_for_sender(sender_account_id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/transfers/accounts/#{sender_account_id}/receivers", params)
        end
      end
    end
  end
end
