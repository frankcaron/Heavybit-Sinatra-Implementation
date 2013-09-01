Heavybit Sinatra-Stormpath Impl
===============================

A starting point for a Sinatra-Stormpath implementation for Heavybit, this is an extensible modular Sinatra application that can be further extended and wrapped around a full-fledged web application. Written by [Frank Caron](frank@stormpath.com) using the Stormpath Ruby SDK.


### Prelude

This demonstrative implementation has been written as a starting point for Heavybit's proposed projects which are implementing  [Stormpath](http://www.stormpath.com) in a Sinatra environment.

The following capabilities have been implemented:

* Account creation
* Authentication
* Password Reset
* Sinatra-centric, modular protected resource structure

### Assumptions

This readme assumes that you have already set up a developer account with Stormpath and know how to retrieve your API key and your application URL. If you don't know how to do this, refer to [Stormpath's REST Quickstart Guide](http://www.stormpath.com/docs/rest/quickstart)

### Screenshot
![alt tag](impl.png)

### Set up Instructions

1. Clone the repository to your local machine.
2. Navigate to the cloned directory via the command line.
3. Run `bundle install` to install the dependencies.
4. Set the following environment variables (e.g., on OS X, `nano ~/.bash_profile` from the terminal):

		export STORMPATH_API_KEY_FILE_LOCATION=~/.stormpath/apiKey.properties
		export STORMPATH_APPLICATION_URL=http://yourappurlhere

5. Configure the password reset page on your directory within the [Stormpath API Console](http://api.stormpath.com) to use the following URL for its Password Reset workflow (Directory > Workflows > Password Reset show link):

		localhost:9292/accounts/recover

6. Run the app locally by running the following command from the repo root:

		rackup config.ru

### Dependencies

This impl relies on the following, which can all be installed from Rubygems.org using `gem install` individually or by via `bundle`. 

* Ruby (latest)
* Stormpath SDK (v. 1.0.0.beta2)
* Sinatra
* Thin
	
### To Do

If needed, additional to do's include:

* Access Control (groups)
* Profile editing

### Disclosure

Code provided as-is. No warranty, not guaranteed by anyone for anything other than being an example.