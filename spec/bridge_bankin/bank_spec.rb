# frozen_string_literal: true

RSpec.describe BridgeBankin::Bank do
  let(:bank_id) { 123 }

  describe ".list", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/banks")
      described_class.list
    end
  end

  describe ".find", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/banks/#{bank_id}")
      described_class.find(id: bank_id)
    end
  end
end
