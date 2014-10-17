include_recipe 'apache2::default'

cookbook_file File.join(node['apache']['dir'], 'sites-available', 'AAR-apache.conf') do
  source 'apache.conf'
end

apache_site 'AAR-apache'
