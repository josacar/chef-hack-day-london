default[:awesome][:www].tap do |www|
  www[:directory] = '/var/www/AAR'
  www[:owner] = 'www-data'
  www[:group] = 'www-data'
end
