require "sinatra/base"

module Sinatra
	module HeavybitPortal
		module AuthRouter
			def self.registered(app)
				#Catch
				app.get '/session' do
					@message = "Check that sesh before you wreck that sesh."
					erb :main
				end
			end
		end
	end
end