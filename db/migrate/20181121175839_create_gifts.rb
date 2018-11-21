class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
