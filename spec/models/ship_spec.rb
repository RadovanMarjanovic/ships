require 'rails_helper'

RSpec.describe Ship, type: :model do
  # Association test
  it { should have_many(:containers).dependent(:destroy) }
  it { should have_many(:sailors).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ship_owner) }
  it { should validate_inclusion_of(:ship_owner).in_array(["cma cgm", "maersk", "msc", "cosco", "oocl", "evergreen"]) }

  # Validation tests for nested attributes
  it{ should accept_nested_attributes_for :containers }
  it{ should accept_nested_attributes_for :sailors }
end
