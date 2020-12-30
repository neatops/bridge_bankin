# frozen_string_literal: true

require "time"

module BridgeBankin
  #
  # User authentication & authorization
  #
  class Authorization
    attr_reader :access_token, :expires_at

    #
    # Initializes Authorization
    #
    # @param [String] access_token access token the access token provided by the API
    # @param [Time] expires_at the expiration time for the provided access token
    #
    def initialize(access_token, expires_at)
      @access_token = access_token
      @expires_at = Time.parse(expires_at)
    end

    class << self
      include API::Resource

      #
      # Authenticate user with the corresponding credentials
      #
      # @param [String] email the registered user email
      # @param [String] password the registered user password
      #
      # @return [Authorization] the authorization informations provided by the API
      #
      def generate_token(email:, password:)
        response = api_client.post("/v2/authenticate", email: email, password: password)
        new(response[:access_token], response[:expires_at])
      end
    end
  end
end
