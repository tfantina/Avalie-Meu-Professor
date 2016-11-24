class AddClassToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :class, :string
  end
end
