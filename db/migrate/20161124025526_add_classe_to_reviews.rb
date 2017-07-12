class AddClasseToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :classe, :string
  end
end
