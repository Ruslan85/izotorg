class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.text :content
      t.integer :manufacturer_id
      t.integer :image

      t.timestamps
    end
  end
end
