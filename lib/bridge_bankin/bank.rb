# frozen_string_literal: true

module BridgeBankin
  #
  # Bank resource
  #
  class Bank < BridgeObject
    RESOURCE_TYPE = "bank"

    class << self
      include API::Resource

      #
      # List all banks supported by the Bridge API
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Bank>] the supported banks list
      #
      def list(**params)
        data = api_client.get("/v2/banks", params)
        convert_to_bridge_object(data)
      end

      #
      # Retrieve a single bank
      #
      # @param [Integer] id the id of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Bank] the requested bank
      #
      def find(id:, **params)
        data = api_client.get("/v2/banks/#{id}", params)
        convert_to_bridge_object(data)
      end
    end
  end
end
