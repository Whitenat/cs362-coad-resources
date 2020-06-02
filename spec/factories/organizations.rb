FactoryBot.define do
    factory :organization do

        sequence(:email) { |n| "user#{n}@fake.com" }

        sequence(:name) { |n| "user#{n}" }

        phone {'1487-561-4687'}
        primary_name{'B'}
        secondary_name{'S'}
        secondary_phone{'1539-473-9047'}

        trait :approved do 
            status { :approved }
        end
    end
end