class RemoveSessionTokenFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :session_token
  end
end
