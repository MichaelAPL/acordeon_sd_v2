class AddUserEditingIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :user_editing_id, :int, :null => :true
  end
end
