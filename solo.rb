root = File.absolute_path(File.dirname(__FILE__))

file_cache_path  root
cookbook_path    [ root + '/cookbooks', root + '/site-cookbooks' ]
data_bag_path    root + '/data_bags'
environment_path root + '/environments'
role_path        root + '/roles'

environment      'production'
