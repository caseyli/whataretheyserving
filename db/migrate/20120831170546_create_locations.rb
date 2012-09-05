class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_1
      t.string :street2
      t.string :city
      t.string :prov_state
      t.string :postal_zip
      t.string :phone
      t.string :url

      t.timestamps
    end
  end
end
