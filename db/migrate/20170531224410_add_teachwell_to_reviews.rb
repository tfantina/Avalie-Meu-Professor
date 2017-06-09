class AddTeachwellToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :teachwell, :boolean
  end
end
