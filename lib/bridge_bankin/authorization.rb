# frozen_string_literal: true

require "time"

module BridgeBankin
  class Authorization < Resource
    attr_reader :access_token, :expires_at

    def initialize(access_token, expires_at)
      super
      @access_token = access_token
      @expires_at = Time.parse(expires_at)
    end

    class << self
      def generate_token(email:, password:)
        response = api_client.post("/v2/authenticate", email: email, password: password)
        new(response[:access_token], response[:expires_at])
      end
    end
  end
end
