FactoryBot.define do
  factory :post do 
    title { Faker::Book.title }
    content { Faker::MostInterestingManInTheWorld.quote }
    author_id 1
  end
end