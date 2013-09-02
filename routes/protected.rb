## ProtectedRouter
## 
## This router handles all protected resource requests.

require "sinatra/base"

module Sinatra
    module HeavybitPortal
        module ProtectedRouter
            def self.registered(app)

                app.before "/protected/*" do
                    # Check if the user is already authenticated
                    # before any request to a protected source
                    require_logged_in
                end

                # Handle a protected resource request
                app.get "/protected/" do
                    # Display success message
                    @message = "You have successfully viewed a protected resource."
                    erb :protected_main
                end

                # Handle a non-protected resource request
                # to all non-existent resources
                app.get '/protected/*' do 
                    # 404
                    erb :not_found, {:status => 404}
                end

            end
        end
    end
end