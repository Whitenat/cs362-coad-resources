require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    context 'As a public user' do
        describe 'GET #index' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path) }
        end

        specify "GET #show" do
            expect(get(:show, params: {id: 'FAKE'})).to redirect_to(new_user_session_path)
        end

        specify "GET #new" do
            expect(get(:new)).to redirect_to(new_user_session_path )
        end

        specify "POST #create" do
            expect(post(:create, params: {organization: attributes_for(:organization)})).to redirect_to(new_user_session_path)
        end

        specify "PUT #update" do
            expect(put(:update, params: {id: 'FAKE', organization: attributes_for(:organization)})).to redirect_to(new_user_session_path)
        end

        specify "POST #approve" do
            expect(post(:approve, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)
        end

        specify "POST #reject" do
            expect(post(:reject, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)
        end
    end

    context 'As an Organization User' do
        let(:user) { create(:user, :organization_member)}
        let(:admin_user) {create(:user, :admin)}
        before do   
            sign_in(user)
        end

        specify 'GET #index' do
            expect(get(:index)).to be_successful 
        end

        specify "GET #new" do
            expect(get(:new)).to be_successful
        end

        specify "POST #create" do
            sign_in(admin_user)
            expect(post(:create, params: {organization: attributes_for(:organization)})).to redirect_to("/dashboard")
        end

        specify "PUT #update" do
            organization = create(:organization)
            expect(put(:update, params:{id: organization.id, organization: attributes_for(:organization)})).to redirect_to("/dashboard")
        end

    end

end

