class Record < ApplicationRecord
  validates :action, :input, :user_name

  ACTION_CREATE = 'Alta'
  ACTION_UPDATE = 'Modificacion'
  ACTION_DELETE = 'Eliminacion'
  SUBJECT = 'Tema'
  CONCEPT = 'Concepto'
end
