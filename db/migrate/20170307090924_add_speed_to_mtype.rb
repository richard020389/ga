class AddSpeedToMtype < ActiveRecord::Migration[5.0]
  def change
    add_column :mtypes, :speed, :integer, default: 1
  end
end
