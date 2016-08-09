class RemoveSignintimesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
  end
end
