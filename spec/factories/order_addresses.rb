FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    prefecture_id { 2 }
    city          { '横浜市緑区' }
    block         { '青山１−１−１' }
    building      { '柳ビル１０３' }
    phone_number  { '09012345678' }

    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
