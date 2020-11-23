FactoryBot.define do

  factory :item do
    name                  {"トマト"}
    introduction          {"美味しい"}
    condition_id          {2}
    postage_payer_id      {3}
    prefecture_id         {4}
    preparation_day_id    {5}
    category_id           {create(:category).id}
    price              {500}
    # xxxxxx                {nil}
    # user_id             {"1"}
    user_id             {create(:user).id}
  end

  factory :item_image do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/app-store-logo.png'))}
    # image {File.open("#{Rails.root}/public/images/apple-touch-icon.png")}
    # image                 {"app/assets/images/image_6.jpg"}
  end

  # after(:build) do |item|
  #   item.item_images << FactoryBot.build(:item_image)
  # end
end