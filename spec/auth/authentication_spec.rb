require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "authentication: " do 
	before :all do 
		@surveyor = Surveyor.new({'email'=>'test@test.com'})
		@surveyor.password = 'test'
		@surveyor.save!
	end
	after :all do 
		@surveyor.destroy!
	end

	describe '/login' do 
		it 'should throw error with missing credentials' do
			put '/auth/login', {'email':nil, 'password':'blargh'}
			expect(last_response.status).to eq(403)
		end

		it 'should throw error with incorrect credentials' do 
			put '/auth/login', {'email':'another@test.com', 'password':'test'}
			expect(last_response.status).to eq(403)
		end

		it 'should return user with API key upon correct credentials' do
			put '/auth/login', {'email':'test@test.com', 'password':'test'}
			expect(last_response.body).to include("api_key")
		end
	end

	describe 'logout' do 
		it 'should throw error with missing API key' do
			put '/auth/logout'
			expect(last_response.status).to eq(403)
		end

		it 'should throw error with non-existent API key' do
			header "ACCESS_TOKEN", 'nonsense'
			put '/auth/logout'
			expect(last_response.status).to eq(403)
		end

		it 'should remove API key from user with correct key' do
			put '/auth/login', {'email':'test@test.com', 'password':'test'} #set API key
			@surveyor.reload!
			header "ACCESS_TOKEN", @surveyor.api_key
			put '/auth/logout'
			expect(last_response.status).to eq(200)
			expect(@surveyor.api_key).to eq(nil)
		end
	end

	describe 'reset password' do 
		it 'should throw error if user not found with email' do
		end

		it 'should send email if user found' do
		end

		it 'should reset password with new password' do 
		end
	end
end