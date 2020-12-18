# frozen_string_literal: true

RSpec.describe BridgeBankin::Resource do
  shared_examples "a protected resource" do
    it "raises a not implemented error" do
      expect { subject }.to raise_error("Not implemented")
    end
  end

  shared_examples "a not implemented method" do
    it "raises a not implemented error" do
      expect { subject }.to raise_error("Not implemented")
    end
  end

  describe ".list" do
    subject { described_class.list }
    it_behaves_like "a not implemented method"
  end

  describe ".list_updated" do
    subject { described_class.list }
    it_behaves_like "a not implemented method"
  end

  describe ".find" do
    subject { described_class.find("resource_id") }
    it_behaves_like "a not implemented method"
  end
end
