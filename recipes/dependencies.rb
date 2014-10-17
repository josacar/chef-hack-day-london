platform = node[:platform].to_sym

node[:awesome][:dependencies][platform].each do |p|
  package p
end

python_pip 'flask'
