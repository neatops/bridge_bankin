# frozen_string_literal: true

RSpec.describe BridgeBankin::API::Client do
  subject(:api_client) { described_class.new }

  let(:request_path) { "/api/request/path" }

  it "has supported HTTP verbs defined" do
    expect(described_class::HTTP_VERBS_MAP).to eq(
      {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post,
        put: Net::HTTP::Put,
        delete: Net::HTTP::Delete
      }
    )
  end

  describe "#get" do
    it "calls `request` with :get HTTP method" do
      expect(api_client).to receive(:request).with(:get, any_args)
      api_client.get(request_path)
    end
  end

  describe "#post" do
    it "calls `request` with :post HTTP method" do
      expect(api_client).to receive(:request).with(:post, any_args)
      api_client.post(request_path)
    end
  end

  describe "#put" do
    it "calls `request` with :put HTTP method" do
      expect(api_client).to receive(:request).with(:put, any_args)
      api_client.put(request_path)
    end
  end

  describe "#delete" do
    it "calls `request` with :delete HTTP method" do
      expect(api_client).to receive(:request).with(:delete, any_args)
      api_client.delete(request_path)
    end
  end
end
