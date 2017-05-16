class Concept < ApplicationRecord
  validates :name, presence: true
  validates :definition, presence: true
  belongs_to :subject
end
