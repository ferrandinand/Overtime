FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
  factory :user do
    first_name 'Jhon3'
    last_name 'Snow3'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
  factory :user2, class: "User" do
    first_name 'Jhon3'
    last_name 'Snow3'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    email 'fe23@fer.com' 
    last_name 'User3'
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
