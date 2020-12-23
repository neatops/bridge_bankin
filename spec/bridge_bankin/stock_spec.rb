# frozen_string_literal: true

RSpec.describe BridgeBankin::Stock do
  let(:stock_id) { 2_535_999 }

  describe ".list", public_resource: true do
    subject { described_class.list }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks" }
    end
  end

  describe ".list_updated", public_resource: true do
    subject { described_class.list_updated }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks/updated" }
    end
  end

  describe ".find", public_resource: true do
    subject { described_class.find(id: stock_id) }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks/#{stock_id}" }
    end
  end
end
