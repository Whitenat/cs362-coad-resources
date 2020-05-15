FactoryBot.define do
    factory :ticket do
        sequence(:name) { |n| "ticket#{n}" }

       phone {'487-561-4687'}
       region_id{ :region } 
       resource_category_id{ :resource_category }
       organization_id{ :organization }
   end
end