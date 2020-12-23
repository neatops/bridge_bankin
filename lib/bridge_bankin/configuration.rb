# frozen_string_literal: true

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

  class Configuration
    attr_reader :api_base_url, :api_version
    attr_accessor :api_client_id, :api_client_secret

    def initialize
      @api_base_url = "https://sync.bankin.com"
      @api_version = "2019-02-18"
      @api_client_id = "d16099aec29e445dbb31cf3966b3821e"
      @api_client_secret = "HEb73vHEGB4Hunv5OMXFUDNIgNonYJ89YaHHRSyidVgCPbCtFWqtED5fZYObA0lm"
    end
  end
end
