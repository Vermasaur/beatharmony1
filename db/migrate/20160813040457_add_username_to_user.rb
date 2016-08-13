class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true #indexes usernames for rapid lookup, and then ensures that each username is unique
  end
end
