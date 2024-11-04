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

  context "when api_version is not specified" do
    it "returns default value" do
      expect(BridgeBankin.configuration.api_version).to eq "2021-06-01"
    end
  end

  context "when api_version is specified" do
    it "returns configured value" do
      BridgeBankin.configure { |config| config.api_version = "2024-01-01" }
      expect(BridgeBankin.configuration.api_version).to eq "2024-01-01"
    end
  end

  context "when locale is not specified" do
    it "returns default value" do
      expect(BridgeBankin.configuration.locale).to eq "en"
    end
  end

  context "when locale is specified" do
    it "returns configured value" do
      BridgeBankin.configure { |config| config.locale = "fr" }
      expect(BridgeBankin.configuration.locale).to eq "fr"
    end
  end
end
