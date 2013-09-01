require "sinatra/base"

module Sinatra
	module HeavybitPortal
		module GeneralRouter
			def self.registered(app)
				#Catch
				app.get '/name/:name' do
					@message = "Hi, my name is (wicky, wicky) slim #{params[:name]}"
					erb :main
				end

				# Test
				app.get '/' do 
					@message = "Hello from GeneralRouter! Youse a genius."
					erb :main
				end
			end
		end
	end
end