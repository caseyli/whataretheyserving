class Entry < ActiveRecord::Base
	
	default_scope order("date desc")
	
  attr_accessible :description, :downvotes, :location_id, :upvotes, :date
  belongs_to :location
end
