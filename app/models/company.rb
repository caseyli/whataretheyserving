class Company < ActiveRecord::Base
	
	default_scope order("name asc")
	
  attr_accessible :name
  has_many :locations
end
