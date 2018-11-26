class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :gift_sku
      t.monetize :amount, currency: { present: false }
      t.json :payment
      t.string :address
      t.integer :unit
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :province
      t.string :phone_number
      t.references :user, foreign_key: true
    end
  end
end
