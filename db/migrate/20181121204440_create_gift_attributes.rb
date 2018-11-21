class CreateGiftAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_attributes do |t|
      t.integer :strength
      t.references :gift, foreign_key: true
      t.references :attribute, foreign_key: true

      t.timestamps
    end
  end
end
