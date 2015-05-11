require 'ffaker'

FactoryGirl.define do
  factory :ticket do
    name { FFaker::Product.product }
    categories do
      Category::CATEGORIES.sample(2)
    end
  end
end
