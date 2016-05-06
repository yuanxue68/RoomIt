class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string
    add_column :users, :phone, :string
    add_attachment :users, :avatar
  end
end
