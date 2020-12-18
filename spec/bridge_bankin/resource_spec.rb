# frozen_string_literal: true

RSpec.describe BridgeBankin::Resource do
  shared_examples "a protected resource" do
    it "raises a not implemented error" do
      expect { subject }.to raise_error("Not implemented")
    end
  end
end
