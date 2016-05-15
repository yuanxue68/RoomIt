class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index:true, null: false
      t.references :post, index: true, null: false
      t.timestamps null: false
    end
  end
end
