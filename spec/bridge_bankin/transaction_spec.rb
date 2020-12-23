# frozen_string_literal: true

RSpec.describe BridgeBankin::Transaction do
  let(:transaction_id) { 38_000_209_858_994 }
  let(:account_id) { 22_167_851 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/transactions" }
    end
  end

  describe ".list_updated", private_resource: true do
    subject { described_class.list_updated(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/transactions/updated" }
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: transaction_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/transactions/#{transaction_id}" }
    end
  end

  describe ".list_by_account", private_resource: true do
    subject { described_class.list_by_account(account_id: account_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/accounts/#{account_id}/transactions" }
    end
  end

  describe ".list_updated_by_account", private_resource: true do
    subject { described_class.list_updated_by_account(account_id: account_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/accounts/#{account_id}/transactions/updated" }
    end
  end

  describe ".list_by_iban", private_resource: true do
    subject { described_class.list_by_iban(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v2/transactions/search" }
    end
  end
end
