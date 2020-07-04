FactoryBot.define do
  factory :ship do
    name { Faker::Ancient.god }
    ship_owner { "cma cgm"}

    #nested factories
    factory :container do
      container_type { "40st" }
      quantity { 111 }
      ship
    end

    factory :sailor do
      name { Faker::Name.name }
      sailor_type { "captain" }
      ship
    end
  end
end
