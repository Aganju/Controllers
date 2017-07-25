class EditColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name
    remove_column :users, :email
    add_column :users,  :user_name, :string
  end
end
