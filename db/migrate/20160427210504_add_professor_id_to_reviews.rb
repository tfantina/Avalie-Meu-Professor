class AddProfessorIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :professor_id, :integer
  end
end
