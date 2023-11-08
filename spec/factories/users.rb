FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a'+ Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { Gimei.family.kanji }
    first_name            { Gimei.first.kanji }
    family_name_kana      { Gimei.family.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
