platform = node[:platform].to_sym

node[:awesome][:dependencies][platform].each do |p|
  package p
end

include_recipe 'python::default'

python_pip 'flask'
