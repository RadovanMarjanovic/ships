require 'rails_helper'

RSpec.describe Container, type: :model do
  # Association test
  it { should belong_to(:ship) }
  # Validation tests
  it { should validate_presence_of(:container_type) }
  it { should validate_presence_of(:quantity) }

  it { should validate_inclusion_of(:container_type).in_array(%w(20st 40st 40hc 45)) }
end
