class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :available_date
      t.string :home_type, null: false
      t.string :room_type, null: false
      t.integer :bedroom, null: false
      t.integer :bathroom, null: false
      t.string :apt_num
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :province, null: false
      t.string :postal_code, null: false
      t.boolean :has_tv, null: false
      t.boolean :has_kitchen, default: false
      t.boolean :has_air, default: false
      t.boolean :has_heating, default: false
      t.boolean :has_internet, default: false
      t.integer :price, null: false
      t.references :user, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
