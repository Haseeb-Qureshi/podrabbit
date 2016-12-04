class AddSessionTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string, unique: true, index: true
  end
end
