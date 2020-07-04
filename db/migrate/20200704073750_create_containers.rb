class CreateContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :containers do |t|
      t.uuid :uuid
      t.string :container_type
      t.integer :quantity
      t.references :ship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
