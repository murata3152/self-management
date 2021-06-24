FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    last_name             {"山田"}
    first_name            {"正解"}
    last_name_details     {"ヤマダ"}
    first_name_details    {"セイカイ"}
    birthday              {Faker::Date.birthday(min_age: 7, max_age: 91)}
    email                 {Faker::Internet.free_email}
    password              {"a1" + Faker::Alphanumeric.alphanumeric(number: 6)}
    password_confirmation {password}
    hobby                 {"登山"}
  end
end