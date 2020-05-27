require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
		before(:each) do
        @organization = FactoryBot.create(:organization)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

	it 'displays rejected message' do
		visit organizations_path
		click_on 'Pending'
		click_on @organization.name
		fill_in 'Rejection Reason', with: 'Rejected'
		click_on 'Reject' 
		expect(page).to have_content('Organization '+ @organization.name + ' has been rejected.')
	end
end
