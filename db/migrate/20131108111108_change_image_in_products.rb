class ChangeImageInProducts < ActiveRecord::Migration
  
  def change
  	change_column :products, :image, :string
  end
end
