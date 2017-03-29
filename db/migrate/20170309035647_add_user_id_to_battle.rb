class AddUserIdToBattle < ActiveRecord::Migration[5.0]
  def change
    add_column :battles, :user_id, :integer
  end
end
