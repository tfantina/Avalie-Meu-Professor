class RemoveColumnFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :tests
    remove_column :reviews, :hw
  end
end
