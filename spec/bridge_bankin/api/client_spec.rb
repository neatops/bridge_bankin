# frozen_string_literal: true

RSpec.describe BridgeBankin::API::Client do
  subject { described_class.new }

  let(:request_path) { "/v2/users" }

  it "has a base URL defined" do
    expect(described_class::BASE_URL).to eq "https://sync.bankin.com"
  end

  it "has headers defined" do
    headers = described_class::HEADERS

    expect(headers).to be_a(Hash)
    expect(headers.keys).to match_array(%w[Bankin-Version Client-Id Client-Secret])
    expect(headers["Bankin-Version"]).to eq "2019-02-18"
  end

  it "has supported HTTP verbs defined" do
    supported_http_verbs = described_class::HTTP_VERBS_MAP

    expect(supported_http_verbs).to eq(
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
      expect(subject).to receive(:request).with(:get, request_path, any_args)
      subject.get(request_path)
    end

    it "returns a parsed JSON response (Hash)" do
      expect(subject.get(request_path)).to be_a(Hash)
    end
  end

  describe "#post" do
    it "calls `request` with :post HTTP method" do
      expect(subject).to receive(:request).with(:post, request_path, any_args)
      subject.post(request_path)
    end

    it "returns a parsed JSON response (Hash)" do
      expect(subject.get(request_path)).to be_a(Hash)
    end
  end

  describe "#put" do
    it "calls `request` with :put HTTP method" do
      expect(subject).to receive(:request).with(:put, request_path, any_args)
      subject.put(request_path)
    end

    it "returns a parsed JSON response (Hash)" do
      expect(subject.get(request_path)).to be_a(Hash)
    end
  end

  describe "#delete" do
    it "calls `request` with :delete HTTP method" do
      expect(subject).to receive(:request).with(:delete, request_path, any_args)
      subject.delete(request_path)
    end

    it "returns a parsed JSON response (Hash)" do
      expect(subject.get(request_path)).to be_a(Hash)
    end
  end
end
