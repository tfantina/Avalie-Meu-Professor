class AddClassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class, :string
  end
end
