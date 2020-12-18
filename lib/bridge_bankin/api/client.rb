# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

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
            request.body = params.to_json if method != :get
          end
        end
      end

      def make_http_request
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          http_response = http.request(yield)
          # TODO: Add error handling
          JSON.parse(http_response.body, symbolize_names: true)
        end
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
    end
  end
end
