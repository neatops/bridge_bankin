# frozen_string_literal: true

RSpec.describe BridgeBankin::Authorization do
  describe ".generate_token", public_resource: true do
    subject do
      VCR.use_cassette("request_access_token") do
        described_class.generate_token(user_credentials)
      end
    end

    let(:user_credentials) { { email: "john.doe@email.com", password: "password123" } }

    it "returns the API result as a new instance of the current class" do
      expect(subject).to be_a(described_class)
      expect(subject.access_token).not_to be_nil
      expect(subject.access_token).to be_a String
      expect(subject.expires_at).not_to be_nil
      expect(subject.expires_at).to be_a Time
    end
  end
end
