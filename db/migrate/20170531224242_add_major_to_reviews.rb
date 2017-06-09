class AddMajorToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :major, :string
  end
end
