class AddBioAndPrivateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :private, :boolean, default: true
  end
end
