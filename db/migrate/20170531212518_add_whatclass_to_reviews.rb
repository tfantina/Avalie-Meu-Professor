class AddWhatclassToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :whatclass, :string
  end
end
