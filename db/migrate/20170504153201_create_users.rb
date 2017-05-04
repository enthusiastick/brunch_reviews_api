class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :handle, null: false
      t.string :last_name
      t.datetime :last_signed_in_at
      t.string :password_digest
      t.integer :sign_in_count, default: 0

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :handle, unique: true
  end
end
