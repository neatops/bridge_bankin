# frozen_string_literal: true

RSpec.describe BridgeBankin::Bank, resource: true do
  describe ".list" do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/banks")
      described_class.list
    end
  end

  describe ".find" do
    let(:bank_id) { ":id" }

    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/banks/#{bank_id}")
      described_class.find(bank_id)
    end
  end
end
