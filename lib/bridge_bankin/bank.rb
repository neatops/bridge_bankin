# frozen_string_literal: true

module BridgeBankin
  class Bank < BridgeObject
    RESOURCE_TYPE = "bank"

    class << self
      include API::Resource

      def list
        data = api_client.get("/v2/banks")
        convert_to_bridge_object(data)
      end

      def find(id:)
        data = api_client.get("/v2/banks/#{id}")
        convert_to_bridge_object(data)
      end
    end
  end
end
