class AddUserIdToRules < ActiveRecord::Migration
  def change
    add_column :rules, :user_id, :integer
    add_index :rules, :user_id
  end
end
