# frozen_string_literal: true

module BridgeBankin
  class Stock < BridgeObject
    RESOURCE_TYPE = "stock"

    class << self
      include API::Resource

      def list(**params)
        data = api_client.get("/v2/stocks", params)
        convert_to_bridge_object(data)
      end

      def list_updated(**params)
        data = api_client.get("/v2/stocks/updated", params)
        convert_to_bridge_object(data)
      end

      def find(id:, **params)
        data = api_client.get("/v2/stocks/#{id}", params)
        convert_to_bridge_object(data)
      end
    end
  end
end
