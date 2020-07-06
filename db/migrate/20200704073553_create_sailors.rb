class CreateSailors < ActiveRecord::Migration[6.0]
  def change
    create_table :sailors do |t|
      t.uuid :uuid
      t.string :name
      t.string :sailor_type
      t.references :ship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
