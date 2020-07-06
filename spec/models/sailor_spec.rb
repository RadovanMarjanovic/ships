require 'rails_helper'

RSpec.describe Sailor, type: :model do
  # Association test
  it { should belong_to(:ship) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sailor_type) }
  it { should validate_inclusion_of(:sailor_type).in_array(["captain", "first officer", "second officer", "third officer", "ingeneer"]) }
end
