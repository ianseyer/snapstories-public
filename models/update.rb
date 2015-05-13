class Update
	include Mongoid::Document

	field :project_id, type:Integer
	field :title, type:String
	field :body, type:String
	field :seen, type:Boolean
	field :image_id, type:Integer
	field :specific_surveyor_id, type:Integer
end