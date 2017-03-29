class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.text :userBefore
      t.text :userAfter
      t.text :monsterBefore
      t.text :monsterAfter

      t.timestamps
    end
  end
end
