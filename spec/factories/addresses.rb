FactoryBot.define do
  factory :address do
    postcode      { '123-4567' }
    prefecture_id { 2 }
    city          { '横浜市緑区' }
    block         { '青山１−１−１' }
    # building
    phone_number  { '09012345678' }

    # association :order
  end
end
