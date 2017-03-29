class AddStatusToBattle < ActiveRecord::Migration[5.0]
  def change
    add_column :battles, :status, :string
  end
end
