# frozen_string_literal: true

module BridgeBankin
  class Insight < Resource
    class << self
      def categories_insights(access_token:, **params)
        protected_resource(access_token) do
          api_client.get("/v2/insights/category", params)
        end
      end
    end
  end
end
