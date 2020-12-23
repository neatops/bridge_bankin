# frozen_string_literal: true

module BridgeBankin
  class Stock < BridgeObject
    RESOURCE_TYPE = "stock"

    class << self
      include API::Resource

      def list
        data = api_client.get("/v2/stocks")
        convert_to_bridge_object(data)
      end

      def list_updated
        data = api_client.get("/v2/updated")
        convert_to_bridge_object(data)
      end

      def find(id:)
        data = api_client.get("/v2/stocks/#{id}")
        convert_to_bridge_object(data)
      end
    end
  end
end
