# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    is_subscribed { Faker::Boolean }
  end
end
