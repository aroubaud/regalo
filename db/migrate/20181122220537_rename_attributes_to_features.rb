class RenameAttributesToFeatures < ActiveRecord::Migration[5.2]
  def change
    rename_table :attributes, :features
    rename_table :gift_attributes, :gift_features
  end
end
