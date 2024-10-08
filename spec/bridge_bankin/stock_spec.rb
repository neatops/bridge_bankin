# frozen_string_literal: true

RSpec.describe BridgeBankin::Stock do
  let(:stock_id) { 2_535_999 }

  describe ".list", :private_resource do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks" }
    end
  end

  describe ".list_updated", :private_resource do
    subject { described_class.list_updated(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks/updated" }
    end
  end

  describe ".find", :private_resource do
    subject { described_class.find(id: stock_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/stocks/#{stock_id}" }
    end
  end
end
