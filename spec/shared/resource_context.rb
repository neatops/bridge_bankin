# frozen_string_literal: true

RSpec.shared_context "resource context", shared_context: :metadata do
  let(:api_client) { instance_double("BridgeBankin::API::Client") }

  before { allow(described_class).to receive(:api_client).and_return(api_client) }

  it "inherits from Resource class" do
    expect(described_class).to be < BridgeBankin::Resource
  end
end
