class Record < ApplicationRecord
  validates :action, :input, :name_input, :user_name, presence: true

  ACTION_CREATE = 'Alta'
  ACTION_UPDATE = 'Modificacion'
  ACTION_DELETE = 'Eliminacion'
  SUBJECT = 'Tema'
  CONCEPT = 'Concepto'
end
