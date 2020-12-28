module BridgeBankin
  module API
    class Error < StandardError
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
