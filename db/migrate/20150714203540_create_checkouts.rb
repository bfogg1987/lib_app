class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :checked_out_at
      t.datetime :due_back_at
      t.datetime :returned_at

      t.timestamps null: false
    end
  end
end
