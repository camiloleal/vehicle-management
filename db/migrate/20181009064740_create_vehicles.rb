class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :plate, null: false, limit: 6, index: { unique: true }
      t.string :branch, null: false
      t.string :category, null: false
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
