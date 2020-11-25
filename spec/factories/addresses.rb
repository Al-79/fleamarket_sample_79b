FactoryBot.define do

  factory :address do
    address_family_name           {"山田"}
    address_family_name_kana      {"ヤマダ"}
    address_first_name            {"太郎"}
    address_first_name_kana       {"タロウ"}
    prefecture_id                 {"13"}
    post_code                     {"105-0011"}
    city                          {"港区"}
    address_line                  {"芝公園4-2-8"}
  end
end