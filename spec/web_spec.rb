require 'spec_helper'

describe 'awesome::web' do
  let(:vh_file) { '/etc/apache2/sites-available/AAR-apache.conf' }
  subject { ChefSpec::Runner.new.converge(described_recipe) }
  before do
    stub_command("/usr/sbin/apache2 -t")
    allow(File). to receive(:exist?).and_call_original
    allow(File). to receive(:exist?).
      with(vh_file).
      and_return(true)
  end

  it { is_expected.to include_recipe('apache2::default') }
  it { is_expected.to create_cookbook_file(vh_file) }

  it 'creates apache virtualhost' do
    expect(subject).to render_file(vh_file).with_content('WSGIDaemonProcess')
    expect(subject).to run_execute('a2ensite AAR-apache.conf')
    execute_resource = subject.execute('a2ensite AAR-apache.conf')
    expect(execute_resource).to notify('service[apache2]').to(:reload).delayed
  end
end
