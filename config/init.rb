# Go to http://wiki.merbivore.com/pages/init-rb
require 'config/dependencies.rb'

# dm-more dependencies
dependency 'dm-timestamps'
dependency 'dm-types'
dependency 'dm-serializer'
dependency 'dm-validations'

# merb-more dependencies
dependency 'merb-action-args'
dependency 'merb-assets'
dependency 'merb-builder'
dependency 'merb-cache'
dependency 'merb-haml'
dependency 'merb-helpers'
dependency 'merb-jquery'
dependency 'merb-mailer'
dependency 'merb-slices'
dependency "merb-auth-core"
dependency "merb-auth-more"
dependency "merb-auth-slice-password"

# merb-plugins dependencies
dependency 'merb_param_protection'
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '1205346b9baa87cf8e49f78124c8d17a31ac0971'  # required for cookie session store
  # c[:session_id_key] = '_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
