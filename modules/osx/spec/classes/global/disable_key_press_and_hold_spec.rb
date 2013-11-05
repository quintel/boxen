require 'spec_helper'

describe 'osx::global::disable_key_press_and_hold' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Disable press-and-hold for accented characters').with({
      :key    => 'ApplePressAndHoldEnabled',
      :domain => 'NSGlobalDomain',
      :value  => false,
      :user   => facts[:boxen_user]
    })
  end
end
