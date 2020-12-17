# frozen_string_literal: true

module BridgeBankin
  class Account < Resource
    class << self
      def list
        api_client.get("/v2/accounts")
      end

      def find(account_id)
        api_client.get("/v2/accounts/#{account_id}")
      end
    end
  end
end
