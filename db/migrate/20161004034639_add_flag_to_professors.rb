class AddFlagToProfessors < ActiveRecord::Migration[5.1]
  def change
    add_column :professors, :flag, :integer, default: 0
  end
end
