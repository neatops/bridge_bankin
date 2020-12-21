# frozen_string_literal: true

RSpec.describe BridgeBankin::Account do
  let(:account_id) { 123 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts", {})
      subject
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: account_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts/#{account_id}", {})
      subject
    end
  end
end
