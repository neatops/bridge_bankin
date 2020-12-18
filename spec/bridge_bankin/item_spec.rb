# frozen_string_literal: true

RSpec.describe BridgeBankin::Item do
  let(:item_id) { 123 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/items", {})
      subject
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: item_id, access_token: "access_token") }
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/items/#{item_id}", {})
      subject
    end
  end

  describe ".refresh", private_resource: true do
    subject { described_class.refresh(id: item_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:post).with("/v2/items/#{item_id}/refresh", {})
      subject
    end
  end

  describe ".refresh_status", private_resource: true do
    subject { described_class.refresh_status(id: item_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/items/#{item_id}/refresh/status", {})
      subject
    end
  end

  describe ".delete", private_resource: true do
    subject { described_class.delete(id: item_id, access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:delete).with("/v2/items/#{item_id}")
      subject
    end
  end
end
