FactoryBot.define do

  factory :item do
    name                  {"トマト"}
    introduction          {"美味しい"}
    condition_id          {2}
    postage_payer_id      {3}
    prefecture_id         {4}
    preparation_day_id    {5}

    category           {create(:category)}
    price              {500}
    # xxxxxx                {nil}
    # user_id             {"1"}
    user_id             {create(:user).id}
  end

  factory :item_image do
    image                 {"app/assets/images/image_6.jpg"}
  end
  after(:build)
end