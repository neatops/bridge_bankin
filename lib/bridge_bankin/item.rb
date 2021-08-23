# frozen_string_literal: true

module BridgeBankin
  #
  # Item resource (bank connector)
  #
  class Item < BridgeObject
    RESOURCE_TYPE = "item"

    # TODO: Add support of item statuses

    class << self
      include API::Resource

      #
      # List all logged in user items
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Item>] the user items
      #
      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Retrieve a single item for logged in user
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Account] the requested user item
      #
      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Trigger a refresh for a specific item
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the item refresh status path
      #
      def refresh(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v2/items/#{id}/refresh", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Request the refresh status of a specific item
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the user item refresh status
      #
      def refresh_status(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/items/#{id}/refresh/status", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Delete a specific item
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Boolean] the request success status
      #
      def delete(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.delete("/v2/items/#{id}", **params)
          true
        end
      end
    end
  end
end
