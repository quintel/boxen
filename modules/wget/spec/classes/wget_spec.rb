require 'spec_helper'

describe 'wget' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('wget')
  end
end
