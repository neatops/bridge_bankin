# frozen_string_literal: true

RSpec.describe BridgeBankin::Bank do
  describe ".list", public_resource: true do
    subject { described_class.list }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/banks" }
    end
  end

  describe ".find", public_resource: true do
    subject { described_class.find(id: bank_id) }

    it_behaves_like "a public resource" do
      let(:bank_id) { 457 }
      let(:request_method) { :get }
      let(:endpoint) { "/v2/banks/#{bank_id}" }
    end
  end
end
