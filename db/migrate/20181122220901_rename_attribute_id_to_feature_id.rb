class RenameAttributeIdToFeatureId < ActiveRecord::Migration[5.2]
  def change
    rename_column :gift_features, :attribute_id, :feature_id
  end
end
