class ChangeMtypeColum < ActiveRecord::Migration[5.0]
  def change
    rename_column :monsters, :mtype, :monstertype
    rename_column :mtypes, :mtype, :monstertype
  end
end
