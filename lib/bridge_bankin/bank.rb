# frozen_string_literal: true

module BridgeBankin
  class Bank < BridgeObject
    RESOURCE_TYPE = "bank"

    class << self
      include API::Resource

      def list(**params)
        data = api_client.get("/v2/banks", params)
        convert_to_bridge_object(data)
      end

      def find(id:, **params)
        data = api_client.get("/v2/banks/#{id}", params)
        convert_to_bridge_object(data)
      end
    end
  end
end
