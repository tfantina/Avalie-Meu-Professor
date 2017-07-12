class FixColumnName < ActiveRecord::Migration[5.1]
  def change
      rename_column :professors, :fname, :fullname
  end

end
