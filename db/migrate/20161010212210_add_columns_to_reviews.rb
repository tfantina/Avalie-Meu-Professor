class AddColumnsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :flag, :integer, default: 0, :null => false
    add_column :reviews, :useful, :integer, default: 0, :null => false
  end
end
