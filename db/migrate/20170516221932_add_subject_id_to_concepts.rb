class AddSubjectIdToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_reference :concepts, :subject, index: true, foreign_key: true
  end
end
