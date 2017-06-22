FactoryGirl.define do
  factory :post do
    date "2017-01-17"
    rationale "MyText"
    user
  end
  factory :post2, class: "Post" do
    date "2017-01-17"
    rationale "Anything"
    user
  end
end
