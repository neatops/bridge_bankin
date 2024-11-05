# frozen_string_literal: true

module BridgeBankin
  #
  # Connect resource
  #
  class Connect < BridgeObject
    class << self
      include API::Resource

      #
      # Request URL to Bridge's Connect funnel for adding an item
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] URL to Bridge's Connect funnel for adding an item
      #
      def connect_item(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/connect/items/add", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Request the URL to Bridge's Connect funnel for editing an item
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the URL to Bridge's Connect funnel for editing an item
      #
      def edit_item(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/edit", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Request the URL to Bridge's Connect funnel for managing
      # a Strong Customer Authentication and synchronizing an item
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the URL to Bridge's Connect funnel for managing
      #
      def item_sync(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/sync", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Request the URL to Bridge's Connect funnel for validating pro items
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the URL to Bridge's Connect funnel for validating pro items
      #
      def validate_pro_items(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/connect/items/pro/confirmation", **params)
          convert_to_bridge_object(**data)
        end
      end
    end
  end
end
