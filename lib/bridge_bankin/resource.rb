# frozen_string_literal: true

module BridgeBankin
  class Resource
    class << self
      def list
        not_implemented_error
      end

      def find(_resource_id)
        not_implemented_error
      end

      private

      def not_implemented_error
        raise "Not implemented"
      end

      def api_client
        @api_client ||= API::Client.new
      end
    end
  end
end
