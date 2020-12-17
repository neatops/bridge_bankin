# frozen_string_literal: true

RSpec.describe BridgeBankin::Stock, resource: true do
  describe ".list" do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks")
      described_class.list
    end
  end

  describe ".list_updated" do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks")
      described_class.list
    end
  end

  describe ".find" do
    let(:stock_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/stocks/#{stock_id}")
      described_class.find(stock_id)
    end
  end
end
