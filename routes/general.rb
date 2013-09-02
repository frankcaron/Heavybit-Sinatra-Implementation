## GeneralRouter
## 
## This router handles all unprotected resource requests.

require "sinatra/base"

module Sinatra
    module HeavybitPortal
        module GeneralRouter
            def self.registered(app)

                app.before "/" do
                    # Do anything necessary before general requests
                end

                # Handle a non-protected resource request
                app.get '/' do 
                    # Display login form
                    erb :login
                end

            end
        end
    end
end