## -----------------
## 
## Heavybit Sinatra-Stormpath Implementation
## 
## Written by Frank Caron
## frank@stormpath.com
## 
## _Prelude_
##
## This demonstrative impl has been written as a starting point
## for Heavybit's proposed projects which are implementing 
## [Stormpath](http://www.stormpath.com) in a Sinatra environment.
## 
## September 1, 2013
## -----------------

# Check for the appropriate environment variables
# (Should not be explictly reading from the properties file 
# as in the provided code)
if ENV['STORMPATH_API_KEY_FILE_LOCATION'].nil? &&
   ENV['STORMPATH_APPLICATION_URL'].nil?
  raise 'Both STORMPATH_API_KEY_FILE_LOCATION and STORMPATH_APPLICATION_URL must be set'
end

# External Reqs
require "sinatra/base"
require 'stormpath-sdk'

# Internal Reqs
require_relative 'routes/init'
require_relative 'helpers'

# Construct the main Heavybit Sinatra App as a Modular Sinatra App
class HeavybitPortal < Sinatra::Base

	# Set views
	set :views, File.expand_path('../views', __FILE__)

	# Configure logging
	configure :production, :development do
		enable :logging
	end

	# Handle errors
	not_found do
		erb :not_found
	end
	
	# Enable Sessions
	enable :sessions

	# Construct the Stormpath Client
	set :client, Stormpath::Client.new({ :api_key_file_location => ENV['STORMPATH_API_KEY_FILE_LOCATION'] })
  	set :application, settings.client.applications.get(ENV['STORMPATH_APPLICATION_URL'])

	# Register Routers
	register Sinatra::HeavybitPortal::GeneralRouter
	register Sinatra::HeavybitPortal::AuthRouter

end