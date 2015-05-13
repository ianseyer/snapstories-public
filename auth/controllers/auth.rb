SnapStories::Auth.controllers :auth do 
  # Adds an API key to the surveyor with matching credentials.
  # @params [email, password]
  # @return [User]
  # @note This is the only time you will receive an API key! Store immediately.
  # @raise 403 on incorrect or missing credentials
	put 'login' do
		if @data['email'].nil? || @data['password'].nil? #ensure we received credentials
	    @error = APIError.new(403, "Did not receive credentials.")
	    halt 403, render("errors/single")
	  elsif Surveyor.find_by_email(@data['email']).nil? #user does not exist
      @error = APIError.new(403, "No surveyor found with that email.")
      halt 403, render("errors/single")
    else
      @surveyor = Surveyor.authenticate @data['email'], @data['password'] #this sets their API key, and catches auth errors
      if @surveyor.nil?
        @error = APIError.new(403, "Incorrect password.")
        halt 403, render("errors/single")
      else !@surveyor.api_key.nil?
        render("surveyors/single")
      end
      @surveyor.reload #to capture the api key, post-Surveyor.Authenticate
      @logging_in = true #tells our json template below to include an api_key node.
      render("surveyors/single")
    end
	end

	put 'logout' do
		if env['HTTP_ACCESS_TOKEN'].nil?
      @error = APIError.new(403, "Did not receive an API key.")
      halt 403, render("errors/single")
    else
      @surveyor = Surveyor.find_by_api_key(env['HTTP_ACCESS_TOKEN'])
      Surveyor.logout @surveyor.api_key #unset the API key. This catches errors if a user is not found.
    end
	end
end