def catch_payload
	@data = JSON.parse request.body.read rescue nil
end