class AddPhotoToProfessor < ActiveRecord::Migration
  def change
    add_column :professors, :photo, :string
  end
end
