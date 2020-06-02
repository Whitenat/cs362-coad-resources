require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
	context 'As a public user' do
		describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to(new_user_session_path) }
    end

    describe 'POST #create' do
    	specify { expect(post(:create)).to redirect_to(new_user_session_path) }
    end

    describe 'PUT #update' do
    	specify { expect(put(:update, params: {id: 'FAKE'})).to redirect_to(new_user_session_path)}
    end

    describe 'PATCH #activate' do
    	specify { expect(patch(:activate, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)}
    end

    describe 'PATCH #deactivate' do
    	specify { expect(patch(:deactivate, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)}
    end

    describe 'DELETE #destroy' do
    	specify { expect(delete(:destroy, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)}
    end

	end

	context 'As an organization user' do
    let(:user) { create(:user)}
    before do   
        sign_in(user)
    end

		describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to(dashboard_path) }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to(dashboard_path) }
    end

    describe 'POST #create' do
    	specify { expect(post(:create)).to redirect_to(dashboard_path) }
    end

    describe 'PUT #update' do
    	specify { expect(put(:update, params: {id: 'FAKE'})).to redirect_to(dashboard_path)}
    end

    describe 'PATCH #activate' do
    	specify { expect(patch(:activate, params:{id: 'FAKE'})).to redirect_to(dashboard_path)}
    end

    describe 'PATCH #deactivate' do
    	specify { expect(patch(:deactivate, params:{id: 'FAKE'})).to redirect_to(dashboard_path)}
    end

    describe 'DELETE #destroy' do
    	specify { expect(delete(:destroy, params:{id: 'FAKE'})).to redirect_to(dashboard_path)}
    end

	end

	context 'As an admin user' do
		let(:user) { create(:user, :admin)}
    before do   
        sign_in(user)
    end

		describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
    	specify { expect(post(:create, params: {resource_category: attributes_for(:resource_category)})).to redirect_to(resource_categories_path) }
    end

    specify 'POST #create with duplicate info' do
    	resource_category = create(:resource_category)
    	expect(post(:create, params: {resource_category: attributes_for(:resource_category)})).to redirect_to('/resource_categories')
    end

    specify 'PUT #update' do
    	resource_category = create(:resource_category)
    	expect(put(:update, params: {id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path(resource_category))
    end

    specify 'PATCH #activate' do
    	resource_category = create(:resource_category)
      expect(patch(:activate, params:{id: resource_category.id})).to redirect_to(resource_category_path(resource_category))
    end

    specify 'PATCH #deactivate' do
    	resource_category = create(:resource_category)
      expect(patch(:deactivate, params:{id: resource_category.id})).to redirect_to(resource_category_path(resource_category))
    end

    specify 'DELETE #destroy' do
    	resource_category = create(:resource_category)
    	expect(delete(:destroy, params:{id: resource_category.id})).to redirect_to(resource_categories_path)
    end

	end
end
