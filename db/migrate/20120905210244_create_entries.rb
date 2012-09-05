class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :description
      t.integer :upvotes
      t.integer :downvotes
      t.integer :location_id

      t.timestamps
    end
  end
end
