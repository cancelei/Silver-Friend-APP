FactoryBot.define do
  factory :dim_user do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    account_type { 'consumer' } # Default to consumer if there are more roles, the tests should be refactored accordingly.

    trait :provider do
      account_type { 'provider' }
    end
  end
end
