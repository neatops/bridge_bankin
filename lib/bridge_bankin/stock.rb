# frozen_string_literal: true

module BridgeBankin
  #
  # Stock resource
  #
  class Stock < BridgeObject
    RESOURCE_TYPE = "stock"

    class << self
      include API::Resource

      #
      # List all logged in user stocks
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Stock>] the user accounts
      #
      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/stocks", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # List all logged in user updated stocks
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Stock>] the user accounts
      #
      def list_updated(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/stocks/updated", params)
          convert_to_bridge_object(data)
        end
      end

      #
      # Retrieve a single stock for logged in user
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Account] the user accounts
      #
      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/stocks/#{id}", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
