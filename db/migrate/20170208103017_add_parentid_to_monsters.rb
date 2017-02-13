class AddParentidToMonsters < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :mtype_id, :integer
    add_index :monsters, :mtype_id
    add_column :monsters, :map_id, :integer
    add_index :monsters, :map_id
  end
end
