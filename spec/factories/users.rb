FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"yamadadesu1"}
    password_confirmation    {"yamadadesu1"}
    family_name           {"山田"}
    family_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_date             {"2000-01-01"}
  end
end