# frozen_string_literal: true

module BridgeBankin
  #
  # User resource
  #
  class User < BridgeObject
    RESOURCE_TYPE = "user"

    class << self
      include API::Resource

      #
      # List all registered users
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<User>] the registered users list
      #
      def list(**params)
        data = api_client.get("/v2/users", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Retrieve a specific user
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the requested user
      #
      def find(uuid:, **params)
        data = api_client.get("/v2/users/#{uuid}", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Create a new user
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the newly created user
      #
      def create(**params)
        data = api_client.post("/v2/users", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Update user email
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the updated user
      #
      def update_email(uuid:, **params)
        data = api_client.put("/v2/users/#{uuid}/email", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Update user password
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the updated user
      #
      def update_password(uuid:, **params)
        data = api_client.put("/v2/users/#{uuid}/password", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Delete a specific user
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Boolean] the request success status
      #
      def delete_user(uuid:, **params)
        api_client.delete("/v2/users/#{uuid}", **params)
        true
      end

      #
      # Delete all registered users
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Boolean] the request success status
      #
      def delete_all_users(**params)
        api_client.delete("/v2/users", **params)
        true
      end

      #
      # Check the logged in user email confirmation status
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the user email confirmation status
      #
      def check_email_confirmation(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/users/me/email/confirmation", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Request the URL to access to an interface to manage the logged in user accounts' IBAN
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] an URL to access to the interface to manage accounts' IBAN
      #
      def manage_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/users/manage/accounts/iban", **params)
          convert_to_bridge_object(**data)
        end
      end
    end
  end
end
