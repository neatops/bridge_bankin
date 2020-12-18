# frozen_string_literal: true

RSpec.describe BridgeBankin::Transaction do
  let(:transaction_id) { 123 }
  let(:account_id) { 123 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transactions", {})
      subject
    end
  end

  describe ".list_updated", private_resource: true do
    subject { described_class.list_updated(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transactions/updated", {})
      subject
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: transaction_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transactions/#{transaction_id}", {})
      subject
    end
  end

  describe ".list_by_account", private_resource: true do
    subject { described_class.list_by_account(account_id: account_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts/#{account_id}/transactions", {})
      subject
    end
  end

  describe ".list_updated_by_account", private_resource: true do
    subject { described_class.list_updated_by_account(account_id: account_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/accounts/#{account_id}/transactions/updated", {})
      subject
    end
  end

  describe ".list_by_iban", private_resource: true do
    subject { described_class.list_by_iban(access_token: "access_token") }
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:post).with("/v2/transactions/search", {})
      subject
    end
  end
end
