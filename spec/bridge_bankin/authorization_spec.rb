# frozen_string_literal: true

RSpec.describe BridgeBankin::Authorization do
  describe ".generate_token", public_resource: true do
    subject(:authorization) do
      VCR.use_cassette("request_access_token") do
        described_class.generate_token(**user_credentials)
      end
    end

    let(:user_credentials) { { email: "john.doe@email.com", password: "password123" } }

    it "returns the API result as a new instance of the current class" do
      expect(authorization).to be_a(described_class)
    end

    it "returns a valid API token" do
      expect(authorization.access_token).to be_a String
    end

    it "returns a expiration value as a Time object" do
      expect(authorization.expires_at).to be_a Time
    end
  end
end
