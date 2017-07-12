class CreateProfessors < ActiveRecord::Migration[5.1]
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
