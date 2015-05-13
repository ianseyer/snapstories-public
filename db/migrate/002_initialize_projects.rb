class InitializeProjects < ActiveRecord::Migration
  def self.up
  	create_table :projects do |t|
  		t.string :name
  		t.string :region
  		t.string :description
  		t.float :lat
  		t.float :lng
  		t.integer :logo_image_id

  		t.references :admins, index: true
  		t.references :surveyors, index: true
  		t.references :images, index: true
  		t.references :case_studies, index: true 
  	end
  end

  def self.down
  end
end
