require 'spec_helper'

describe 'awesome::web' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }
  before do
    stub_command("/usr/sbin/apache2 -t")
  end

  it { is_expected.to include_recipe('apache2::default') }
end
