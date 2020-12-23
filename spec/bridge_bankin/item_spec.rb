# frozen_string_literal: true

RSpec.describe BridgeBankin::Item do
  let(:item_id) { 4_388_758 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/items" }
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/items/#{item_id}" }
    end
  end

  describe ".refresh", private_resource: true do
    subject { described_class.refresh(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v2/items/#{item_id}/refresh" }
    end
  end

  describe ".refresh_status", private_resource: true do
    subject { described_class.refresh_status(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/items/#{item_id}/refresh/status" }
    end
  end

  describe ".delete", private_resource: true do
    subject { described_class.delete(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :delete }
      let(:endpoint) { "/v2/items/#{item_id}" }
    end
  end
end
