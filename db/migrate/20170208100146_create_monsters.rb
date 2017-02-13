class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :type
      t.integer :atk
      t.integer :def
      t.integer :hp
      t.integer :exp
      t.integer :lvl

      t.timestamps
    end
  end
end
