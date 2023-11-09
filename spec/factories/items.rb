FactoryBot.define do
  factory :item do
    # image         {Faker::Lorem.sentence}
    item_name     { "ExampleItem" }
    description   { "This is an example item" }
    category_id   { 2 }
    condition_id  { 2 }
    charge_id     { 2 }
    prefecture_id { 2 }
    etd_id        { 2 }
    price         { 333 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
