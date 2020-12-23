# frozen_string_literal: true

module BridgeBankin
  class Category < BridgeObject
    RESOURCE_TYPE = "category"

    class << self
      include API::Resource

      def list(**params)
        data = api_client.get("/v2/categories", params)
        convert_to_bridge_object(data)
      end

      def find(id:, **params)
        data = api_client.get("/v2/categories/#{id}", params)
        convert_to_bridge_object(data)
      end
    end
  end
end
