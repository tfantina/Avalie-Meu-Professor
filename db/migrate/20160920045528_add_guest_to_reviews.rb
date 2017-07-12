class AddGuestToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :guest, :string
  end
end
