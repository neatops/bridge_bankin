# frozen_string_literal: true

RSpec.describe BridgeBankin::Account, resource: true do
  describe ".list" do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts")
      described_class.list
    end
  end

  describe ".find" do
    let(:account_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts/#{account_id}")
      described_class.find(account_id)
    end
  end
end
