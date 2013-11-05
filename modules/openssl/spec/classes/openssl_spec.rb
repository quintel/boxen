require "spec_helper"

describe "openssl" do
  let(:facts) { default_test_facts }

  it do
    should contain_package("openssl")
  end
end
