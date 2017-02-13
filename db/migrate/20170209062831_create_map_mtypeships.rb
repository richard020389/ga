class CreateMapMtypeships < ActiveRecord::Migration[5.0]
  def change
    create_table :map_mtypeships do |t|
      t.integer :map_id
      t.integer :mtype_id

      t.timestamps
    end
  end
end
