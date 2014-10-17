include_recipe 'ark::default'

ark 'awesome' do
  url node[:awesome][:source][:url]
  path node[:awesome][:www][:directory]
  owner node[:awesome][:www][:owner]
  group node[:awesome][:www][:group]
  action :unzip
end
