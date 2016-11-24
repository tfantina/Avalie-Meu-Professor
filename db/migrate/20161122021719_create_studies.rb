class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :study
      t.integer :review_id

      t.timestamps null: false
    end
  end
end
