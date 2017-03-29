class CreateBattlelines < ActiveRecord::Migration[5.0]
  def change
    create_table :battlelines do |t|
      t.text :utext
      t.text :mtext

      t.timestamps
    end
  end
end
