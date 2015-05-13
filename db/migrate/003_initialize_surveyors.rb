class InitializeSurveyors < ActiveRecord::Migration
  def self.up
  	create_table :surveyors do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :bio
  		t.string :lat
  		t.string :lng
  		t.string :password_hash 
  		t.string :encrypted_password
  		t.string :api_key

  		t.references :casestudies, index: true
  		t.references :images, index: true
  		t.references :projects, index: true
  	end
  end

  def self.down
  end
end
