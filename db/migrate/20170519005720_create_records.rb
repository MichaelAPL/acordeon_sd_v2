class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :action
      t.string :input
      t.string :user_name

      t.timestamps
    end
  end
end
