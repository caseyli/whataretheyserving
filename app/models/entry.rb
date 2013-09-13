class Entry < ActiveRecord::Base
  attr_accessible :description, :downvotes, :location_id, :upvotes, :date
  belongs_to :location
end
