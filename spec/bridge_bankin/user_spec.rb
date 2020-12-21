# frozen_string_literal: true

RSpec.describe BridgeBankin::User do
  let(:user_uuid) { SecureRandom.uuid }
  let(:new_user_params) { { email: "john.doe@email.com", password: "password123" } }

  describe ".list", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/users")
      described_class.list
    end
  end

  describe ".find", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/users/#{user_uuid}")
      described_class.find(uuid: user_uuid)
    end
  end

  describe ".create", public_resource: true do
    it "calls API client post method with the endpoint path" do
      expect(api_client).to receive(:post).with("/v2/users", new_user_params)
      described_class.create(new_user_params)
    end
  end

  describe ".update_email", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:put).with("/v2/users/#{user_uuid}/email", {})
      described_class.update_email(uuid: user_uuid)
    end
  end

  describe ".update_password", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:put).with("/v2/users/#{user_uuid}/password", {})
      described_class.update_password(uuid: user_uuid)
    end
  end

  describe ".delete_user", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:delete).with("/v2/users/#{user_uuid}", {})
      described_class.delete_user(uuid: user_uuid)
    end
  end

  describe ".delete_all_users", public_resource: true do
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:delete).with("/v2/users")
      described_class.delete_all_users
    end
  end

  describe ".check_email_confirmation", private_resource: true do
    subject { described_class.check_email_confirmation(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/users/me/email/confirmation", {})
      subject
    end
  end

  describe ".manage_accounts", private_resource: true do
    subject { described_class.manage_accounts(access_token: "access_token") }
    it "calls API client get method with the endpoint path" do
      expect(api_client).to receive(:get).with("/v2/users/manage/accounts/iban", {})
      subject
    end
  end
end
