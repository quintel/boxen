require 'spec_helper'

describe 'sequel_pro' do
  it do
    should contain_package('Sequel Pro').with({
      :provider => 'appdmg',
      :source   => 'http://sequel-pro.googlecode.com/files/sequel-pro-1.0.1.dmg',
    })
  end
end
