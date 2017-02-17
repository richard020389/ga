class ChangeTypeColum < ActiveRecord::Migration[5.0]
  def change
    rename_column :monsters, :type, :mtype
    rename_column :mtypes, :type, :mtype
  end
end
