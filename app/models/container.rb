class Container < ApplicationRecord
  belongs_to :ship

  validates :container_type, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
end
