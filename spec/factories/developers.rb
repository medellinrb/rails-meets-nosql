require 'ffaker'

FactoryGirl.define do
  factory :developer do
    categories do
      tmp = Category::CATEGORIES.sample(2)
      [Category.new(name: tmp[0]), Category.new(name: tmp[1])]
    end
    email { FFaker::Internet.email.downcase }
    password 'qwertyqwerty'
    name { "#{FFaker::Name.name} #{FFaker::Name.last_name}" }
    factory :developer_with_tickets do
      tickets { (1..5).map { FactoryGirl.build(:ticket) } }
    end
  end
end
