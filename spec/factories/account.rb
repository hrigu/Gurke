FactoryGirl.define do
  factory :account do
    username "fritz"
    password "secret"
    password_confirmation { |u| u.password }
    admin false
    email "fritz@example.com"
  end
end