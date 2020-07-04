class Container < ApplicationRecord
  belongs_to :ship

  validates :container_type, presence: true, inclusion: { in: %w(20st 40st 40hc 45) }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
