class AddGradeToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :grade, :float
  end
end
