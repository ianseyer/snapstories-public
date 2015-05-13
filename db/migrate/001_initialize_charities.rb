class InitializeCharities < ActiveRecord::Migration
  def self.up
  	create_table :charities do |t|
      t.string :name
      t.integer :year_est
      t.string :description
      t.string :email
      t.string :website
      t.string :address
      t.integer :logo_image_id #reference to Image id that is the logo
      t.float :lat
      t.float :lng

      t.references :images, index: true
      t.references :projects, index: true
      t.references :admins, index: true
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :charities
  end
end
