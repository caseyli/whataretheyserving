class Location < ActiveRecord::Base
	
	default_scope order("city asc")
	
  attr_accessible :city, :name, :phone, :postal_zip, :prov_state, :street, :url, :company_id
  belongs_to :company
  has_many :entries
  
  def address
    "#{self.street}, #{self.city}"
  end
end
