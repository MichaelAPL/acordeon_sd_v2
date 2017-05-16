class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.text :definition

      t.timestamps null: false
    end
  end
end
