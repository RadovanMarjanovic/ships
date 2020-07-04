require 'rails_helper'

RSpec.describe Container, type: :model do
  # Association test
  it { should belong_to(:ship) }
  # Validation tests
  it { should validate_presence_of(:container_type) }
  it { should validate_presence_of(:quantity) }
end
