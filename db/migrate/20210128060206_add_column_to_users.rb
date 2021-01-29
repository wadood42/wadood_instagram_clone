class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string, null: false
    add_column :users, :email, :string, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
