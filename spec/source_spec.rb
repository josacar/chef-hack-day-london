require 'spec_helper'

describe 'awesome::source' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it { is_expected.to include_recipe('ark::default') }

  it 'downloads source to tmp dir' do
    expect(subject).to unzip_ark('awesome').with(
      url: 'https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip',
      path: '/var/www/AAR',
      owner: 'www-data',
      group: 'www-data'
    )
  end
end
