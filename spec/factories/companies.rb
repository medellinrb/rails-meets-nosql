require 'ffaker'

FactoryGirl.define do
  factory :company do
    email { FFaker::Internet.email.downcase }
    password 'qwertyqwerty'
    name { FFaker::Company.name }
    factory :company_with_tickets do
      tickets { (1..5).map { FactoryGirl.build(:ticket) } }
    end
  end
end
