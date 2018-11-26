class AddSkuToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :sku, :string
  end
end
