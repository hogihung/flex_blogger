class AddDisplaynameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string, default: "anonymous"
  end
end
