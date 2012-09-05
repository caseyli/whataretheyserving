class Entry < ActiveRecord::Base
  attr_accessible :description, :downvotes, :location_id, :upvotes
  belongs_to :location
end
