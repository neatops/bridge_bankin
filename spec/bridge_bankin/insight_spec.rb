# frozen_string_literal: true

RSpec.describe BridgeBankin::Insight do
  describe ".categories_insights", private_resource: true do
    subject { described_class.categories_insights(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/insights/category", {})
      subject
    end
  end
end
