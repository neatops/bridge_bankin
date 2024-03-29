# frozen_string_literal: true

module BridgeBankin
  #
  # Insight resource
  #
  class Insight < BridgeObject
    class << self
      include API::Resource

      #
      # Categories statistics provided by Bridge
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Insight] the statistics generated by Bridge API
      #
      def categories_insights(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/insights/category", **params)
          convert_to_bridge_object(**data)
        end
      end
    end
  end
end
