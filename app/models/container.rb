class Container < ApplicationRecord
  after_create :set_uuid
  after_create :set_serial_number

  belongs_to :ship

  validates :container_type, presence: true, inclusion: { in: %w(20st 40st 40hc 45) }
  validates :quantity, presence: true, numericality: { only_integer: true }

  def set_serial_number
    serial_letters = {
      "cma cgm" => "CMAU",
      "maersk" => "MSKU",
      "msc" => "MSCU",
      "cosco" => "COSU",
      "oocl" => "OCLU",
      "evergreen" => "EMCU"
    }
    self.update(serial_number: serial_letters[self.ship.ship_owner] + self.id.to_s.rjust(6, '0'))
  end
end
