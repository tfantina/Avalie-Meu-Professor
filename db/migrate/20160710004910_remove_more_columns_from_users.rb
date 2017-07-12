class RemoveMoreColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :remember_created_at
    remove_column :users, :sign_in_count
  end
end
