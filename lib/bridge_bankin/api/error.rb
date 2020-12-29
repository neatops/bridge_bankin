# frozen_string_literal: true

module BridgeBankin
  module API
    #
    # Error is the base error from which all other more specific BridgeBankin errors derive.
    #
    class Error < StandardError
      #
      # Initializes Error
      #
      # @param [String] code the HTTP code returned by the API
      # @param [Hash] response_body the parsed API response
      # @option response_body [String] :type 	the machine readable error message
      # @option response_body [String] :message the human readable error message
      # @option response_body [String] :documentation_url the optional link to documentation
      #
      def initialize(code, response_body = {})
        @payload = response_body
        @code = code
        @type = payload[:type]
        @documentation_url = payload[:documentation_url]

        super(payload[:message])
      end

      attr_reader :payload, :code, :type, :documentation_url
    end

    class BadRequestError < Error; end

    class UnauthorizedError < Error; end

    class ForbiddenError < Error; end

    class NotFoundError < Error; end

    class ConflictError < Error; end

    class UnsupportedMediaTypeError < Error; end

    class UnprocessableEntityError < Error; end

    class TooManyRequestsError < Error; end

    class InternalServerError < Error; end
  end
end
