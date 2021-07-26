# frozen_string_literal: true

RSpec.shared_context "when resource is public", shared_context: :metadata do
  let(:api_client) { instance_double("BridgeBankin::API::Client") }

  shared_examples "a public resource" do
    let(:request_params) { defined?(params) ? params : {} }

    before do
      allow(described_class).to receive(:api_client).and_return(api_client)
      allow(described_class).to receive(:convert_to_bridge_object)
    end

    it "inherits from BridgeObject class" do
      expect(described_class).to be < BridgeBankin::BridgeObject
    end

    it "does not require an access_token" do
      allow(api_client).to receive_messages(BridgeBankin::API::Client::HTTP_VERBS_MAP.keys)
      expect(api_client).not_to receive(:access_token=)
      expect(api_client).to receive(request_method).with(endpoint, **request_params).and_return({})
      subject
    end

    it "calls API client with the correct method and endpoint" do
      expect(api_client).to receive(request_method).with(endpoint, **request_params).and_return({})
      subject
    end
  end
end

RSpec.shared_context "when resource is private", shared_context: :metadata do
  let(:authorization) do
    VCR.use_cassette("request_access_token") do
      BridgeBankin::Authorization.generate_token(
        **{
          email: "john.doe@email.com",
          password: "password123"
        }
      )
    end
  end
  let(:access_token) { authorization.access_token }
  let(:api_client) { instance_double("BridgeBankin::API::Client") }

  shared_examples "a protected resource" do
    let(:request_params) { defined?(params) ? params : {} }

    before do
      allow(described_class).to receive(:api_client).and_return(api_client)
      allow(described_class).to receive(:convert_to_bridge_object)
    end

    it "inherits from BridgeObject class" do
      expect(described_class).to be < BridgeBankin::BridgeObject
    end

    it "requires an access_token" do
      allow(api_client).to receive_messages(BridgeBankin::API::Client::HTTP_VERBS_MAP.keys)
      expect(api_client).to receive(:access_token=).with(access_token).and_return({})
      expect(api_client).to receive(request_method).with(endpoint, **request_params).and_return({})
      subject
    end

    it "calls API client with the correct method and endpoint" do
      allow(api_client).to receive(:access_token=).with(access_token)
      expect(api_client).to receive(request_method).with(endpoint, **request_params).and_return({})
      subject
    end
  end
end
