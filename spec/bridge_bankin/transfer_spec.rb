# frozen_string_literal: true

RSpec.describe BridgeBankin::Transfer do
  let(:transfer_uuid) { SecureRandom.uuid }
  let(:sender_account_id) { 123 }

  describe ".send", private_resource: true do
    subject { described_class.send(access_token: "access_token") }
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:post).with("/v2/pay/transfer/url", {})
      subject
    end
  end

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transfers", {})
      subject
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(uuid: transfer_uuid, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transfers/#{transfer_uuid}", {})
      subject
    end
  end

  describe ".list_all_sender_accounts", private_resource: true do
    subject { described_class.list_all_sender_accounts(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transfers/accounts/senders", {})
      subject
    end
  end

  describe ".list_all_receiver_accounts", private_resource: true do
    subject { described_class.list_all_receiver_accounts(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transfers/accounts/receivers", {})
      subject
    end
  end

  describe ".list_receiver_accounts_for_sender", private_resource: true do
    subject do
      described_class
        .list_receiver_accounts_for_sender(sender_account_id: sender_account_id, access_token: "access_token")
    end
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/transfers/accounts/#{sender_account_id}/receivers", {})
      subject
    end
  end
end
