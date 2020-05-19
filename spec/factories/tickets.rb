FactoryBot.define do
    factory :ticket do
       sequence(:name) { |n| "ticket#{n}" }
       phone {'1487-561-4687'}
       region
       resource_category
       trait :with_organization do
       	 organization
       end 
   end
end