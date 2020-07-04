class AddColumntToContainer < ActiveRecord::Migration[6.0]
  def change
    add_column :containers, :serial_number, :string
  end
end
