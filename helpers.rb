# Helpers
require 'sinatra/base'

module Sinatra
  module HeavybitPortal
    module Helpers

    	# Auth Helpers
    	def require_logged_in()
        	redirect('/session/new') unless is_authenticated?
      	end

      	def require_logged_out()
        	redirect('/') if is_authenticated?
      	end

	      def is_authenticated?()
	        return !!session[:stormpath_account_url]
	      end

	      def initialize_session(display_name, stormpath_account_url)
	        session[:display_name] = display_name
	        session[:stormpath_account_url] = stormpath_account_url
	      end

	      def destroy_session()
	        session.delete(:display_name)
	        session.delete(:stormpath_account_url)
	        @is_admin = false
	      end

    end
  end
end