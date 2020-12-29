# frozen_string_literal: true

module BridgeBankin
  #
  # User resource
  #
  class User < BridgeObject
    RESOURCE_TYPE = "user"

    class << self
      include API::Resource

      def list(**params)
        data = api_client.get("/v2/users", params)
        convert_to_bridge_object(data)
      end

      def find(uuid:, **params)
        data = api_client.get("/v2/users/#{uuid}", params)
        convert_to_bridge_object(data)
      end

      def create(**params)
        data = api_client.post("/v2/users", params)
        convert_to_bridge_object(data)
      end

      def update_email(uuid:, **params)
        data = api_client.put("/v2/users/#{uuid}/email", params)
        convert_to_bridge_object(data)
      end

      def update_password(uuid:, **params)
        data = api_client.put("/v2/users/#{uuid}/password", params)
        convert_to_bridge_object(data)
      end

      def delete_user(uuid:, **params)
        data = api_client.delete("/v2/users/#{uuid}", params)
        convert_to_bridge_object(data)
      end

      def delete_all_users(**params)
        data = api_client.delete("/v2/users", params)
        convert_to_bridge_object(data)
      end

      def check_email_confirmation(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/users/me/email/confirmation", params)
          convert_to_bridge_object(data)
        end
      end

      def manage_accounts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v2/users/manage/accounts/iban", params)
          convert_to_bridge_object(data)
        end
      end
    end
  end
end
