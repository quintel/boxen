require 'spec_helper'

describe 'xquartz' do
  it do
    should contain_package('XQuartz').with({
      :provider => 'pkgdmg',
      :source   => 'http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg'
    })
  end
end
