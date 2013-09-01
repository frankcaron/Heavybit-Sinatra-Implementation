## AccountRouter
## 
## This router handles all account-related requests.

require "sinatra/base"

module Sinatra
	module HeavybitPortal
		module AccountRouter
			def self.registered(app)
		     	
		     	app.before "/accounts/*" do
			      	# Check if the user is not already authenticated
			      	# before any request to a non-protected resource
			      	require_logged_out
			    end

		        # Recover a password
		        app.get '/accounts/recover' do
		        	if params[:sptoken] != nil
		        		account = settings.application.verify_password_reset_token params[:sptoken]
		        		@account_href = account.href
		        		erb :password_set
		        	else 
		        		erb :password_reset
		        	end
		        end

		        app.post '/accounts/set' do
		        	
		        	begin
			        	account = settings.client.accounts.get CGI.unescape(params[:account_url])
			        	account.password = params[:password]
	            		account.save

	            		@message = "Your password has been successfully reset."
	            		erb :main
            		rescue Stormpath::Error => error
		            	@error = error.message
		              	erb :password_set
		            end
		        end

		        app.post '/accounts/recover' do
		        	begin
		            	settings.application.send_password_reset_email params[:email]
		            	@message = "An email has been sent to the address specified."
		              	erb :main
		            rescue Stormpath::Error => error
		            	@error = error.message
		              	erb :password_reset
		            end
		        end
				
				# Create an account
		        app.get '/accounts/create' do
		        	erb :account_create
		        end
			end
		end
	end
end