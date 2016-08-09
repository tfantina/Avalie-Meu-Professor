class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :hw
      t.integer :ease
      t.integer :tests
      t.integer :interesting
      t.integer :helpfull
      t.text :comment

      t.timestamps null: false
    end
  end
end
