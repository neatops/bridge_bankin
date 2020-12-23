# frozen_string_literal: true

require "securerandom"

require "bridge_bankin"
require "shared/resource_context"
require "webmock/rspec"
require "vcr"
require "pry"

BridgeBankin.configure do |config|
  config.api_client_id = ENV["BRIDGE_API_CLIENT_ID"]
  config.api_client_secret = ENV["BRIDGE_API_CLIENT_SECRET"]
end

VCR.configure do |config|
  config.cassette_library_dir = "vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.define_cassette_placeholder("<api_client_id>") { BridgeBankin.configuration.api_client_id }
  config.define_cassette_placeholder("<api_client_secret>") { BridgeBankin.configuration.api_client_secret }
  # config.debug_logger = $stderr
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include_context "public resource context", public_resource: true
  config.include_context "private resource context", private_resource: true
end
