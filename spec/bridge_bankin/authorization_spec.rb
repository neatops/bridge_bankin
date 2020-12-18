# frozen_string_literal: true

RSpec.describe BridgeBankin::Authorization, resource: true do
  describe ".generate_token" do
    let(:api_response) do
      {
        access_token: "new_generated_access_token",
        expires_at: Time.now.utc.strftime("%FT%T.%LZ")
      }
    end
    it "calls API client post method with the endpoint path and required params" do
      expect(api_client).to(
        receive(:post)
          .with("/v2/authenticate", email: "john.doe@email.com", password: "password123")
          .and_return(api_response)
      )
      described_class.generate_token(email: "john.doe@email.com", password: "password123")
    end

    it "returns the API result as a new instance of the current class" do
      allow(api_client).to receive(:post).and_return(api_response)
      authorization = described_class.generate_token(email: "john.doe@email.com", password: "password123")

      expect(authorization).to be_a(described_class)
      expect(authorization.access_token).to eq api_response[:access_token]
      expect(authorization.expires_at).to eq Time.parse(api_response[:expires_at])
    end
  end
end
