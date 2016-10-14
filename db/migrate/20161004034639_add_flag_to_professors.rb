class AddFlagToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :flag, :integer, default: 0
  end
end
