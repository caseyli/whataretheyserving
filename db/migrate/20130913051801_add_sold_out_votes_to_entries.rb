class AddSoldOutVotesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :soldoutvotes, :integer
  end
end
