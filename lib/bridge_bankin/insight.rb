# frozen_string_literal: true

module BridgeBankin
  class Insight < BridgeObject
    class << self
      include API::Resource

      def categories_insights(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/insights/category", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
