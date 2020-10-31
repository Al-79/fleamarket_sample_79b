FactoryBot.define do

  factory :item do
    name                  {"トマト"}
    introduction          {"美味しい"}
    category           {"1"}
    condition          {"1"}
    postage_payer      {"1"}
    prefecture         {"1"}
    preparation_day    {"1"}
    price              {"500"}
    user_id             {"1"}
  end

  factory :item_image do
    image                 {"app/assets/images/image_6.jpg"}
  end
  after(:build)
end