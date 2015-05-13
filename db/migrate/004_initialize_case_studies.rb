class InitializeCaseStudies < ActiveRecord::Migration
  def self.up
  	create_table :casestudies do |t|
  		t.integer :report_ids #MongoDB Document IDs
  	end
  end

  def self.down
  	drop_table :casestudies
  end
end
