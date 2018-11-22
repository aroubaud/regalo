class ChangeFacebookIdToBeBigintInFacebookUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :facebook_users, :facebook_id, :bigint
  end
end
