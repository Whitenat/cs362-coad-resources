require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

	before(:each) do
        @user = FactoryBot.create(:user, :organization_member)
        @admin_user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

    it 'creates a new application' do
    	visit dashboard_path
    	click_on 'Create Application'
    	choose('organization_agreement_one_true')
    	choose('organization_agreement_two_true')
    	choose('organization_agreement_three_true')
    	choose('organization_agreement_four_true')
    	choose('organization_agreement_five_true')
    	choose('organization_agreement_six_true')
    	choose('organization_agreement_seven_true')
    	choose('organization_agreement_eight_true')
    	fill_in 'What is your name? (Last, First)', with: 'last, first'
    	fill_in 'Organization Name', with: 'fake organization'
    	fill_in 'What is your title? (if applicable)', with: 'Fake Name1'
    	fill_in 'What is your direct phone number? Cell phone is best.', with: '1112223333'
    	fill_in 'Who may we contact regarding your organization\'s application if we are unable to reach you?', with: 'Fake Name2'
    	fill_in 'What is a good secondary phone number we may reach your organization at?', with: '3332221111'
    	fill_in 'What is your Organization\'s email?', with: 'email@domain.com'
    	fill_in 'organization_description', with: 'description'
    	choose('organization_transportation_yes')
    	click_button 'Apply'
    	expect(page).to have_content('Application Submitted')
    	
    end

	# skip 'sends confirmation email' do
	# 	visit signup_path
	# 	fill_in 'Email', with: 'fake@mail.com'
	# 	fill_in 'Password', with: 'Password'
	# 	fill_in 'Password confirmation', with: 'Password'
	# 	click_button 'Sign up'
	# 	expect(page).to have_content('A message with a confirmation link has been sent to your email address')

	# end
end
