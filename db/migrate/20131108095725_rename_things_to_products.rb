class RenameThingsToProducts < ActiveRecord::Migration
  def change
  	rename_table :things, :products
  end
end
