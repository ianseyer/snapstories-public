class APIError
	def initialize(status, message)
    	@status = status #HTTP status code
    	@message = message #Additional message
  	end

  	def status
  		@status
  	end

  	def message
  		@message
  	end
end