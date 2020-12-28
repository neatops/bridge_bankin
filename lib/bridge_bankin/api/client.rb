# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

require "bridge_bankin/api/error"

module BridgeBankin
  module API
    class Client
      HTTP_VERBS_MAP = {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post,
        put: Net::HTTP::Put,
        delete: Net::HTTP::Delete
      }.freeze

      attr_accessor :access_token

      def get(path, **params)
        request :get, path, params
      end

      def post(path, **params)
        request :post, path, params
      end

      def put(path, **params)
        request :put, path, params
      end

      def delete(path, **params)
        request :delete, path, params
      end

      private

      def request(method, path, params = {})
        make_http_request do
          HTTP_VERBS_MAP[method].new(encode_path(path, params), headers).tap do |request|
            request.set_form_data(params) if method != :get
          end
        end
      end

      def make_http_request
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          api_response = http.request(yield)

          return parse_response_body(api_response.body) if %w[200 201].include?(api_response.code)

          handle_error(api_response)
        end
      end

      def parse_response_body(json_response_body)
        JSON.parse(json_response_body, symbolize_names: true)
      end

      def uri
        @uri ||= URI.parse(BridgeBankin.configuration.api_base_url)
      end

      def headers
        headers =
          {
            "Bankin-Version" => BridgeBankin.configuration.api_version,
            "Client-Id" => BridgeBankin.configuration.api_client_id,
            "Client-Secret" => BridgeBankin.configuration.api_client_secret,
            "Content-Type" => "application/json"
          }

        return headers unless access_token

        headers.merge!("Authorization" => "Bearer #{access_token}")
      end

      def encode_path(path, params = nil)
        URI::HTTP
          .build(path: path, query: URI.encode_www_form(params))
          .request_uri
      end

      def handle_error(api_response)
        response_body = parse_response_body(api_response.body)

        case api_response.code
        when "400"
          raise API::BadRequestError.new(api_response.code, response_body)
        when "401"
          raise API::UnauthorizedError.new(api_response.code, response_body)
        when "403"
          raise API::ForbiddenError.new(api_response.code, response_body)
        when "404"
          raise API::NotFoundError.new(api_response.code, response_body)
        when "409"
          raise API::ConflictError.new(api_response.code, response_body)
        when "415"
          raise API::UnsupportedMediaTypeError.new(api_response.code, response_body)
        when "422"
          raise API::UnprocessableEntityError.new(api_response.code, response_body)
        when "429"
          raise API::TooManyRequestsError.new(api_response.code, response_body)
        when "500"
          raise API::InternalServerError.new(api_response.code, response_body)
        else
          raise API::Error.new(api_response.code, response_body)
        end
      end
    end
  end
end
