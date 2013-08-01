class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_groom
      t.string :name_bride
      t.string :last_name
      t.string :email_groom
      t.string :email_bride
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false

      t.timestamps
    end

    add_index :users, :email_groom,  unique: true
    add_index :users, :email_bride,  unique: true
  	add_index :users, :name_groom,  unique: true
    add_index :users, :name_bride,  unique: true
  	add_index :users, :remember_token
  end
end
