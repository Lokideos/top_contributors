# frozen_string_literal: true

FactoryBot.define do
  factory :contributors_search do
    url { 'https://github.com/rails/rails' }

    trait :invalid do
      url { 'Dio' }
    end
  end
end
