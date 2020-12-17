# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

module BridgeBankin
  module API
    class Client
      # TODO: Remove this in favor of configs
      BRIDGE_API_CLIENT_ID = "d16099aec29e445dbb31cf3966b3821e"
      BRIDGE_API_CLIENT_SECRET = "HEb73vHEGB4Hunv5OMXFUDNIgNonYJ89YaHHRSyidVgCPbCtFWqtED5fZYObA0lm"

      BASE_URL = "https://sync.bankin.com"

      HEADERS = {
        "Bankin-Version" => "2019-02-18",
        "Client-Id" => BRIDGE_API_CLIENT_ID,
        "Client-Secret" => BRIDGE_API_CLIENT_SECRET
      }.freeze

      HTTP_VERBS_MAP = {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post,
        put: Net::HTTP::Put,
        delete: Net::HTTP::Delete
      }.freeze

      def get(path, params: {})
        request :get, path, params
      end

      def post(path, params: {})
        request :post, path, params
      end

      def put(path, params: {})
        request :put, path, params
      end

      def delete(path)
        request :delete, path
      end

      private

      def request(method, path, params = {})
        make_http_request do
          HTTP_VERBS_MAP[method].new(encode_path(path, params), HEADERS).tap do |request|
            request.body = parameterize(params).to_json if method != :get
          end
        end
      end

      def make_http_request
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          http_response = http.request(yield)
          # TODO: Add error handling
          JSON.parse(http_response.body)
        end
      end

      def uri
        @uri ||= URI.parse(BASE_URL)
      end

      def encode_path(path, params = nil)
        URI::HTTP
          .build(path: path, query: URI.encode_www_form(params))
          .request_uri
      end
    end
  end
end
