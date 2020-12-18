# frozen_string_literal: true

RSpec.describe BridgeBankin::Connect do
  let(:iban) { { iban: "FR7330003000305156978968I67" } }

  describe ".connect_item", private_resource: true do
    subject { described_class.connect_item(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/connect/items/add/url", {})
      subject
    end
  end

  describe ".connect_item_with_iban", private_resource: true do
    subject { described_class.connect_item_with_iban(access_token: "access_token") }
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:post).with("/v2/connect/items/add/url", {})
      subject
    end
  end

  describe ".edit_item", private_resource: true do
    subject { described_class.edit_item(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/connect/items/edit/url", {})
      subject
    end
  end

  describe ".item_sync", private_resource: true do
    subject { described_class.item_sync(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/connect/items/sync", {})
      subject
    end
  end

  describe ".validate_email", private_resource: true do
    subject { described_class.validate_email(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/connect/users/email/confirmation/url", {})
      subject
    end
  end

  describe ".validate_pro_items", private_resource: true do
    subject { described_class.validate_pro_items(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/connect/items/pro/confirmation/url", {})
      subject
    end
  end
end
