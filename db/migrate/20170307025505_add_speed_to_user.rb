class AddSpeedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :speed, :integer, default: 2
    add_column :monsters, :speed, :integer, default: 2
  end
end
