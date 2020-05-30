require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
	before(:each) do
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

    context 'as an admin' do
    	it 'creates a region' do
    		click_link 'Regions'
            click_on 'Add Region'
            expect(page).to have_content('Add a region')
            fill_in 'Name', with: 'Fake Region'
            click_button 'Add Region'
            expect(page).to have_content('Region successfully created.')
    	end
    end

end
