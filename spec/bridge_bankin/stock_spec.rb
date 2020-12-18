# frozen_string_literal: true

RSpec.describe BridgeBankin::Stock do
  describe ".list", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks")
      described_class.list
    end
  end

  describe ".list_updated", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks")
      described_class.list
    end
  end

  describe ".find", public_resource: true do
    let(:stock_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks/#{stock_id}")
      described_class.find(stock_id)
    end
  end
end