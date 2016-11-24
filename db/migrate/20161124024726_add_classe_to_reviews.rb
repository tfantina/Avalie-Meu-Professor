class AddClasseToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :classe, :string
  end
end
