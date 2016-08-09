class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :fname
      t.string :lname
      t.string :school
      t.string :department

      t.timestamps null: false
    end
  end
end
