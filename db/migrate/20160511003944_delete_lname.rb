class DeleteLname < ActiveRecord::Migration
  def change
    remove_column :professors, :lname
  end
end
