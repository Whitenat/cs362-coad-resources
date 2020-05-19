FactoryBot.define do
    factory :resource_category do
        sequence(:name) { |n| "user#{n}" }
    end
end