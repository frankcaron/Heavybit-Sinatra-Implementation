require "sinatra/base"

module Sinatra
	module HeavybitPortal
		module GeneralRouter
			def self.registered(app)

				# Handle a protected resource request
				app.get '/protected/*' do
					# Check for auth
					@message = "You have successfully viewed a protected resource."
					erb :main
				end

				# Handle a non-protected source request
				app.get '/' do 
					# Check for not auth.
					@message = "Welcome. Please log in to continue."
					erb :login
				end

			end
		end
	end
end