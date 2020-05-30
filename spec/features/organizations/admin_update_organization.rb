require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

	before(:each) do
        @organization = FactoryBot.create(:organization)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

	it 'returns to ticket dashboard' do
		visit organizations_path
		click_on 'Pending'
		click_on @organization.name
		click_on 'Edit Organization' 
		expect(page).to have_content('Dashboard')
	end
end

