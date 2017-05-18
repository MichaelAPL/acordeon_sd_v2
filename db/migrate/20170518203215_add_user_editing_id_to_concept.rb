class AddUserEditingIdToConcept < ActiveRecord::Migration[5.0]
  def change
    add_column :concepts, :user_editing_id, :int, :null => :true
  end
end
