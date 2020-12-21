# frozen_string_literal: true

module BridgeBankin
  class Account < Resource
    class << self
      def list(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/accounts", params)
        end
      end

      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/accounts/#{id}", params)
        end
      end
    end
  end
end
