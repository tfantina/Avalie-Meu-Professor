class FixColumnName < ActiveRecord::Migration
  def change
      rename_column :professors, :fname, :fullname
  end

end
