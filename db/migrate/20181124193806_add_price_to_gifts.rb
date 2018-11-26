class AddPriceToGifts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :gifts, :price, currency: { present: false }
  end
end
