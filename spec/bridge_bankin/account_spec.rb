# frozen_string_literal: true

RSpec.describe BridgeBankin::Account do
  describe ".list", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts")
      described_class.list
    end
  end

  describe ".find", public_resource: true do
    let(:account_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts/#{account_id}")
      described_class.find(account_id)
    end
  end
end
