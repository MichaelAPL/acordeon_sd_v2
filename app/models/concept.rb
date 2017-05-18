class Concept < ApplicationRecord
  validates :name, :created_by_user_id, presence: true
  validates :definition, presence: true
  belongs_to :subject
  belongs_to :user
end
