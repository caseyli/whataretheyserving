class Location < ActiveRecord::Base
  attr_accessible :city, :name, :phone, :postal_zip, :prov_state, :street2, :street_1, :url, :company_id
  belongs_to :company
end
