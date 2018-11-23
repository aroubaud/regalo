class AddImageToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :image, :string
  end
end
