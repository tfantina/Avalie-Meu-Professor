class RemoveColumnFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :tests
    remove_column :reviews, :hw
  end
end
