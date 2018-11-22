class CreateFacebookUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :facebook_users do |t|
      t.integer :facebook_id
      t.integer :step

      t.timestamps
    end
  end
end
