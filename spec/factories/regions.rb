FactoryBot.define do
    factory :region do
        name { ' Fake' }
        tickets { [] }
        trait :unspecified do
            name { 'Unspecified' }
        end
    end
end