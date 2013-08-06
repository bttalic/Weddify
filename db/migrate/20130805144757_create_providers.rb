class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :password_digest
      t.integer :category
      t.string :email
      t.string :remember_token

      t.timestamps
    end
    add_index :providers, :email,  unique: true
  	add_index :providers, :name,  unique: true
  	add_index :providers, :remember_token
  end
end
