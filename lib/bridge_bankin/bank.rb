# frozen_string_literal: true

module BridgeBankin
  class Bank < Resource
    class << self
      def list
        api_client.get("/v2/banks")
      end

      def find(bank_id)
        api_client.get("/v2/banks/#{bank_id}")
      end
    end
  end
end
