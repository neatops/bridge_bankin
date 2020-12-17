# frozen_string_literal: true

module BridgeBankin
  class Stock < Resource
    class << self
      def list
        api_client.get("/v2/stocks")
      end

      def list_updated
        api_client.get("/v2/updated")
      end

      def find(stock_id)
        api_client.get("/v2/stocks/#{stock_id}")
      end
    end
  end
end
