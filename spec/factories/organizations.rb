FactoryBot.define do
    factory :organization do

        sequence(:email) { |n| "user#{n}@fake.com" }

        sequence(:name) { |n| "user#{n}" }

        phone {'487-561-4687'}
        primary_name{'Bitch'}
        secondary_name{'Slut'}
        secondary_phone{'539-473-9047'}
    end
end