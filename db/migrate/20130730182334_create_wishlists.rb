class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end

    add_index :wishlists, :user_id, unique: true
	add_index :wishlists, :item_id, unique: true
  end
end
