class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :atk
      t.integer :def
      t.integer :hp
      t.integer :ap
      t.integer :exp
      t.integer :lvl

      t.timestamps
    end
  end
end
