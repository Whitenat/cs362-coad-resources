require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    context 'As a public user' do
        describe 'GET #index' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path) }
        end

        specify "GET #show" do
            expect(get(:show, params: {id: 'FAKE'})).to redirect_to(new_user_session_path)
        end
    end

    context 'As an organization user' do
        let(:user) { create(:user)}
        before do   
            sign_in(user)
        end

        specify 'GET #index' do
            expect(get(:new)).to redirect_to(dashboard_path) 
        end
    end

    context 'As an admin user' do 
        let(:admin) { create(:user, :admin)}
        before do   
            sign_in(admin)
        end
            
        specify 'GET #index' do
            expect(get(:index)).to be_successful 
        end

        # specify "GET #show" do
        #     region = create(:region)
        #     expect(get(:show, params: {id: 'FAKE'})).to be_successful
        # end
    end

    # specify "GET #new" do
    #     expect(get(:new)).to be_successful
    # end

    # specify "GET #edit" do
    #     region = create(:region)
    #     expect(get(:edit, params: {id: region.id})).to be_successful
    # end

    # specify "POST #create" do
    #     expect(post(:create, params: {region: {name: 'FAKE'}})).to redirect_to(regions_path)
    # end

    # specify "PUT #update" do
    #     region = create(:region)
    #     expect(put(:update, params {id: region.id, region: atrributes_for(:region)})).to redirect_to(regions_path(region))
    # end

    # specify "DELETE #destroy" do
    #     region = create(:region)
    #     expect( )



    # context 'As an admin user' do 
    #     let(:admin) { create(:user, :admin)}
    #     before do   
    #         sign_in(admin)
    #     end


    # context 'As an admin' do   
    #     let(:admin_user) { create(:user, "admin") }
    #     before(:each) { sign_in(admin_user) }

    #     describe 'GET #index' do
    #         specify { expect(get(:index)).to be_successful }
    #     end
    # end

end

