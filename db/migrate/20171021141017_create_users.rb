class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
