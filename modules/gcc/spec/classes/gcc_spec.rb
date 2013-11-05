require 'spec_helper'

describe 'gcc' do
  let(:facts) { default_test_facts }

  it do
    should contain_homebrew__formula('apple-gcc42').
      with_before('Package[boxen/brews/apple-gcc42]')

    should contain_package('boxen/brews/apple-gcc42').with({
      :ensure => '4.2.1-5666.3-boxen1'
    })
  end
end
