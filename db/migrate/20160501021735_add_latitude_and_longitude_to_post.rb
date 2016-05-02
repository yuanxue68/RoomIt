class AddLatitudeAndLongitudeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_index :posts, [:latitude, :longitude]
  end
end
