# frozen_string_literal: true

RSpec.describe BridgeBankin::API::Error do
  subject { described_class }

  it { is_expected.to be < StandardError }

  context "when instantiated" do
    subject(:api_error) { described_class.new("409", api_error_response) }

    let(:api_error_response) do
      {
        type: "conflict",
        message: "A user with email john.doe@email.com already exists",
        documentation_url: "https://docs.bridgeapi.io/docs/api-responses"
      }
    end

    describe "#code" do
      it "returns HTTP error code" do
        expect(api_error.code).to eq "409"
      end
    end

    describe "#message" do
      it "returns the API response error message" do
        expect(api_error.message).to eq "A user with email john.doe@email.com already exists"
      end
    end

    describe "#type" do
      it "returns the API response error type" do
        expect(api_error.type).to eq "conflict"
      end
    end

    describe "#documentation_url" do
      it "returns the API response error documentation_url" do
        expect(api_error.documentation_url).to eq "https://docs.bridgeapi.io/docs/api-responses"
      end
    end

    describe "#payload" do
      it "returns the API response error payload" do
        expect(api_error.payload).to eq api_error_response
      end
    end
  end
end

RSpec.describe BridgeBankin::API::BadRequestError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::UnauthorizedError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::ForbiddenError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::NotFoundError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::ConflictError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::UnsupportedMediaTypeError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::UnprocessableEntityError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::TooManyRequestsError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end

RSpec.describe BridgeBankin::API::InternalServerError do
  subject { described_class }

  it { is_expected.to be < BridgeBankin::API::Error }
end
