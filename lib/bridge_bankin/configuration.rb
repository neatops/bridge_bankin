# frozen_string_literal: true

#
# BridgeBankin module
#
module BridgeBankin
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

  #
  # Configurations setup
  #
  class Configuration
    attr_reader :api_base_url

    attr_accessor \
      :api_client_id,
      :api_client_secret,
      :api_version,
      :locale,
      :follow_pages

    #
    # Initializes Configuration
    #
    def initialize
      @api_base_url = "https://api.bridgeapi.io"
      @api_version = "2021-06-01"
      @api_client_id = ""
      @api_client_secret = ""
      @locale = "en"
      @follow_pages = false
    end
  end
end
