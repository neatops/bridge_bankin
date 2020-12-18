# frozen_string_literal: true

RSpec.shared_context "public resource context", shared_context: :metadata do
  let(:api_client) { instance_double("BridgeBankin::API::Client") }

  before { allow(described_class).to receive(:api_client).and_return(api_client) }

  it "inherits from Resource class" do
    expect(described_class).to be < BridgeBankin::Resource
  end
end

RSpec.shared_context "private resource context", shared_context: :metadata do
  let(:api_client) { instance_double("BridgeBankin::API::Client") }

  before do
    allow(described_class).to receive(:api_client).and_return(api_client)
    allow(api_client).to receive(:access_token=).and_return("access_token")
  end

  it "inherits from Resource class" do
    expect(described_class).to be < BridgeBankin::Resource
  end

  it "requires an access_token" do
    allow(api_client).to receive_messages(BridgeBankin::API::Client::HTTP_VERBS_MAP.keys)
    expect(api_client).to receive(:access_token=)
    subject
  end
end
