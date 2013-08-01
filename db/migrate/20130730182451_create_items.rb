class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :wishlist_id
      t.string :name
      t.string :link
      t.integer :priority
      t.integer :status

      t.timestamps
    end

   add_index :items, [:wishlist_id, :id], unique: true
  end
end
