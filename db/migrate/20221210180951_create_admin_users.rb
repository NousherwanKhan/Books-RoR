class CreateAdminUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :admin_users do |t|
      t.string 'first_name', :limit => 12
      t.string 'last_name', :limit => 12
      t.string 'email', :null => false
      t.string 'password', :limit => 16
      t.string 'username', :limit => 15
      t.timestamps
    end
  end

  def down 
    drop_table :admin_users
  end
end
