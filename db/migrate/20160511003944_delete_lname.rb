class DeleteLname < ActiveRecord::Migration[5.1]
  def change
    remove_column :professors, :lname
  end
end
