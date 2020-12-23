# frozen_string_literal: true

RSpec.describe BridgeBankin::Category do
  let(:category_id) { 123 }

  describe ".list", public_resource: true do
    subject { described_class.list }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/categories" }
    end
  end

  describe ".find", public_resource: true do
    subject { described_class.find(id: category_id) }

    it_behaves_like "a public resource" do
      let(:category_id) { 457 }
      let(:request_method) { :get }
      let(:endpoint) { "/v2/categories/#{category_id}" }
    end
  end
end
