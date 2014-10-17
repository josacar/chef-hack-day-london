require 'serverspec'

set :backend, :exec

describe 'awesome app' do
  it 'installs apache2 and start it' do
    expect(package('apache2')).to be_installed
    expect(port(80)).to be_listening.with('tcp6')
  end

  it 'creates directory' do
    deploy_dir = file('/var/www/AAR')
    expect(deploy_dir).to be_directory
    expect(deploy_dir).to be_owned_by('www-data')
    expect(deploy_dir).to be_grouped_into('www-data')
  end

  it 'clones source and extracts it' do
    expect(file('/var/www/AAR/AAR/awesomeapp.wsgi')).to be_file
  end

  it 'installs python packages' do
    %w(libapache2-mod-wsgi python-pip python-mysqldb).each do |package|
      expect(package(package)).to be_installed
    end
  end

  it 'installs apache virtualhost' do
    file = file('/etc/apache2/sites-enabled/AAR-apache.conf')
    expect(file).to be_file
  end
end
