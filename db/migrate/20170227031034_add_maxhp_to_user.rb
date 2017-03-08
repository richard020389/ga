class AddMaxhpToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :maxhp, :integer
    add_column :users, :maxhp, :integer
  end
end
