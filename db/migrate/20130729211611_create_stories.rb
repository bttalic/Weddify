class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.text :story_text
      t.integer :provider_id

      t.timestamps
    end

	add_index :stories, :user_id, unique: true
	add_index :stories, :provider_id, unique: true
  end
end
