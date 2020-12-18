# frozen_string_literal: true

module BridgeBankin
  class User < Resource
    class << self
      def list
        api_client.get("/v2/users")
      end

      def create(**params)
        api_client.post("/v2/users", params)
      end

      def update_email(uuid:, **params)
        api_client.put("/v2/users/#{uuid}/email", params)
      end

      def update_password(uuid:, **params)
        api_client.put("/v2/users/#{uuid}/password", params)
      end

      def delete_user(uuid:, **params)
        api_client.delete("/v2/users/#{uuid}", params)
      end

      def delete_all_users
        api_client.delete("/v2/users")
      end

      def check_email_confirmation(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/users/me/email/confirmation", params)
        end
      end

      def manage_accounts(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/users/manage/accounts/iban", params)
        end
      end
    end
  end
end
