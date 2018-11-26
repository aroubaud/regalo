class RemovePriceFromGifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :gifts, :price, :integer
  end
end
