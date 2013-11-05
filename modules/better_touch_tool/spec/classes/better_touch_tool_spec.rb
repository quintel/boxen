require 'spec_helper'

describe 'better_touch_tool' do
  it do
    should contain_package('Better Touch Tool').with({
      :provider => 'compressed_app',
      :source   => 'http://bettertouchtool.net/BetterTouchTool.zip'
    })
  end
end
