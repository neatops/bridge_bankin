# frozen_string_literal: true

RSpec.describe BridgeBankin::Insight do
  describe ".categories_insights", private_resource: true do
    subject { described_class.categories_insights(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v2/insights/category" }
    end
  end
end
