class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :giver_id, index: true, null: false
      t.integer :receiver_id, index: true, null: false
      t.string :content, null: false
      t.timestamps null: false
    end

    add_foreign_key :reviews, :users, column: :giver_id
    add_foreign_key :reviews, :users, column: :receiver_id
  end
end
