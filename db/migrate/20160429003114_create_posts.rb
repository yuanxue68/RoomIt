class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :home_type
      t.string :room_type
      t.integer :bedroom
      t.integer :bathroom
      t.string :address
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_air
      t.boolean :has_heating
      t.boolean :hes_internet
      t.integer :price
      t.references :user, index: true, foreign_key: true  

      t.timestamps null: false
    end
  end
end
