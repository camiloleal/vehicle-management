class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false, index: true
      t.string :document_number, null: false, index: { unique: true }
      t.string :document_file

      t.timestamps
    end
  end
end
