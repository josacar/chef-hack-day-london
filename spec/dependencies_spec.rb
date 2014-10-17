require 'spec_helper'

describe 'awesome::dependencies' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it { is_expected.to install_package('libapache2-mod-wsgi') }
  it { is_expected.to install_package('python-pip') }
  it { is_expected.to install_package('python-mysqldb') }

  it { is_expected.to install_python_pip('flask') }
end
