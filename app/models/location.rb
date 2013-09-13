class Location < ActiveRecord::Base
	
	default_scope order("city asc")
	
  attr_accessible :city, :name, :phone, :postal_zip, :prov_state, :street2, :street_1, :url, :company_id
  belongs_to :company
  has_many :entries
  
  def address
    "#{self.street_1}, #{self.street2}, #{self.city}"
  end
end
