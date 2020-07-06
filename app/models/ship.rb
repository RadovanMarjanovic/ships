class Ship < ApplicationRecord
  after_create :set_uuid

  has_many :containers, dependent: :destroy
  has_many :sailors, dependent: :destroy

  validates :name, presence: true
  validates :ship_owner, presence: true, inclusion: { in: ["cma cgm", "maersk", "msc", "cosco", "oocl", "evergreen"] }

  accepts_nested_attributes_for :containers, :sailors, allow_destroy: true
end
