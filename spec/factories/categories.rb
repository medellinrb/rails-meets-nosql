require 'ffaker'

FactoryGirl.define do
  factory :category do
    name { Category::CATEGORIES.sample }
  end
end
