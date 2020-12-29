# frozen_string_literal: true

module BridgeBankin
  #
  # Category resource
  #
  class Category < BridgeObject
    RESOURCE_TYPE = "category"

    class << self
      include API::Resource

      #
      # List all categories supported by the Bridge API
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Category>] the supported categories list
      #
      def list(**params)
        data = api_client.get("/v2/categories", params)
        convert_to_bridge_object(data)
      end

      #
      # Retrieve a single category
      #
      # @param [Integer] id the id of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Category] the requested category
      #
      def find(id:, **params)
        data = api_client.get("/v2/categories/#{id}", params)
        convert_to_bridge_object(data)
      end
    end
  end
end
