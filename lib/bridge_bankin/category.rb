# frozen_string_literal: true

module BridgeBankin
  class Category < Resource
    class << self
      def list
        api_client.get("/v2/categories")
      end

      def find(category_id)
        api_client.get("/v2/categories/#{category_id}")
      end
    end
  end
end