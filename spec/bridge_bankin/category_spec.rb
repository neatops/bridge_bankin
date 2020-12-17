# frozen_string_literal: true

RSpec.describe BridgeBankin::Category, resource: true do
  describe ".list" do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/categories")
      described_class.list
    end
  end

  describe ".find" do
    let(:category_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/categories/#{category_id}")
      described_class.find(category_id)
    end
  end
end
