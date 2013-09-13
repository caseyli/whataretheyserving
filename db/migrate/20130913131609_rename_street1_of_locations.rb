class RenameStreet1OfLocations < ActiveRecord::Migration
  def up
		rename_column :locations, :street_1, :street
  end

  def down
		rename_column :locations, :street, :street_1
  end
end
