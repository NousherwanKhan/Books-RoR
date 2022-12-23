class AddDigestPasswordToAdminUsers < ActiveRecord::Migration[6.1]
  def up 
    remove_column 'admin_users', 'password'
    add_column 'admin_users', 'password_digest', :string
  end
  def down
    remove_column 'admin_users', 'password_digest'
    add_column 'admin_users', 'password', :string, :limit => 16
  end

end
