class AddBattleidToBattleline < ActiveRecord::Migration[5.0]
  def change
    add_column :battlelines, :battle_id, :integer
  end
end
