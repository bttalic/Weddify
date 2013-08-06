class CreateGalleries < ActiveRecord::Migration
	def change
		create_table :galleries do |t|
			t.integer :photo_id
			t.integer :user_id
			t.integer :provider_id

			t.timestamps
		end
		add_index :galleries, :user_id, unique: true
		add_index :galleries, :provider_id, unique: true
	end
end
