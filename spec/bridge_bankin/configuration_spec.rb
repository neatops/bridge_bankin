# frozen_string_literal: true

RSpec.describe BridgeBankin::Configuration do
  context "when api_client_id is specified" do
    it "returns configured value" do
      BridgeBankin.configure { |config| config.api_client_id = "bridge_client_id" }
      expect(BridgeBankin.configuration.api_client_id).to eq "bridge_client_id"
    end
  end

  context "when bridge_client_secret is specified" do
    it "returns configured value" do
      BridgeBankin.configure { |config| config.api_client_secret = "bridge_client_secret" }
      expect(BridgeBankin.configuration.api_client_secret).to eq "bridge_client_secret"
    end
  end
end
