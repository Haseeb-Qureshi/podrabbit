class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest, index: true, null: false
      t.integer :producer_id, index: true
      t.timestamps
    end
  end
end
