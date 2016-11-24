class RemoveClassFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :class, :string
  end
end
