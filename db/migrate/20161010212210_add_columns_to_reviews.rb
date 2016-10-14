class AddColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :flag, :integer, default: 0
    add_column :reviews, :useful, :integer, default: 0
  end
end
