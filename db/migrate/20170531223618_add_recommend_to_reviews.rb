class AddRecommendToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :recommend, :boolean
  end
end
