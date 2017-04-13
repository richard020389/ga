class ChangeSpeedDefault < ActiveRecord::Migration[5.0]
  def change
    
    change_column_default :mtypes, :speed, default: nil
    change_column_default :users, :speed, default: nil
    change_column_default :monsters, :speed, default: nil
  end
end
