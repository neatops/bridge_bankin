# frozen_string_literal: true

module BridgeBankin
  class Category < BridgeObject
    RESOURCE_TYPE = "category"

    class << self
      include API::Resource

      def list
        data = api_client.get("/v2/categories")
        convert_to_bridge_object(data)
      end

      def find(id:)
        data = api_client.get("/v2/categories/#{id}")
        convert_to_bridge_object(data)
      end
    end
  end
end
