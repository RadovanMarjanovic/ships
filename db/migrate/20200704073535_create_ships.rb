class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.uuid :uuid
      t.string :ship_owner
      t.string :name
      t.string :serial_number

      t.timestamps
    end
  end
end
