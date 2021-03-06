class Sailor < ApplicationRecord
  after_create :set_uuid

  belongs_to :ship

  validates :name, presence: true
  validates :sailor_type, presence: true, inclusion: { in: ["captain", "first officer", "second officer", "third officer", "ingeneer"] }
end
