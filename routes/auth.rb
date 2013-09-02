## AuthRouter
## 
## This router handles all authentication and session requests.

require "sinatra/base"

module Sinatra
    module HeavybitPortal
        module AuthRouter
            def self.registered(app)

                # On login form submit
                app.post '/session' do
                    # Double-check that the user is not already authorized
                    require_logged_out

                    # Capture form data
                    email_or_username = params[:email_or_username]
                    password = params[:password]

                    # Crete a log in request
                    login_request = Stormpath::Authentication::UsernamePasswordRequest.new(
                      email_or_username,
                      password
                    )

                    # Authorize the request and redirect or error out
                    begin
                      authentication_result = settings.application.authenticate_account login_request
                      initialize_session email_or_username, authentication_result.account.href
                      redirect '/protected/'
                    rescue Stormpath::Error => error
                      @error = error.message
                      erb :login
                    end
                end

                # End the session
                app.delete '/session' do
                    # Check the log in
                    require_logged_in

                    # Destroy the session
                    destroy_session 

                    #Redirect
                    redirect '/'
                end
            end
        end
    end
end