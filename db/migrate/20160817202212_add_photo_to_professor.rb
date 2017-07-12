class AddPhotoToProfessor < ActiveRecord::Migration[5.1]
  def change
    add_column :professors, :photo, :string
  end
end
