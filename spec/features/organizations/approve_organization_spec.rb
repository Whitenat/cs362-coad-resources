require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

	before(:each) do
        @organization = FactoryBot.create(:organization)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

	it 'displays approved message' do
		visit organizations_path
		click_on 'Pending'
		click_on @organization.name
		click_on 'Approve' 
		expect(page).to have_content('Organization '+ @organization.name + ' has been approved.')
	end

end
