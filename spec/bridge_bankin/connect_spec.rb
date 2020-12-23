# frozen_string_literal: true

RSpec.describe BridgeBankin::Connect do
  let(:iban) { { iban: "FR7330003000305156978968I67" } }

  describe ".connect_item", private_resource: true do
    subject { described_class.connect_item(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/connect/items/add/url" }
    end
  end

  describe ".connect_item_with_iban", private_resource: true do
    subject { described_class.connect_item_with_iban(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v2/connect/items/add/url" }
    end
  end

  describe ".edit_item", private_resource: true do
    subject { described_class.edit_item(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/connect/items/edit/url" }
    end
  end

  describe ".item_sync", private_resource: true do
    subject { described_class.item_sync(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/connect/items/sync" }
    end
  end

  describe ".validate_email", private_resource: true do
    subject { described_class.validate_email(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/connect/users/email/confirmation/url" }
    end
  end

  describe ".validate_pro_items", private_resource: true do
    subject { described_class.validate_pro_items(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/connect/items/pro/confirmation/url" }
    end
  end
end
