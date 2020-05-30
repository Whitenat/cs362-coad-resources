require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    context 'As a public user' do
        describe 'GET #index' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path) }
        end

        specify "GET #show" do
            expect(get(:show, params: {id: 'FAKE'})).to redirect_to(new_user_session_path)
        end

        specify "POST #new" do
            expect(post(:new)).to redirect_to(new_user_session_path )
        end

        specify "POST #create" do
            expect(post(:create, params: {region: attributes_for(:region)})).to redirect_to(new_user_session_path)
        end

        specify "PUT #update" do
            expect(put(:update, params: {id: 'FAKE', region: attributes_for(:region)})).to redirect_to(new_user_session_path)
        end

        specify "POST #approve" do
            expect(post(:approve, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)
        end

        specify "POST #reject" do
            expect(post(:reject, params:{id: 'FAKE'})).to redirect_to(new_user_session_path)
        end
    end

    context 'As an Organization User' do
        let(:user) { create(:user)}
        before do   
            sign_in(user)
        end

        specify 'GET #index' do
            expect(get(:index)).to be_successful 
        end
    end

end

# context 'Organization user' do
#     describe 'POST #create' do 
#     let(:user) do
#         User.create(email: 'fake@fake.com',
#             password: 'password',
#             password_confirmation: 'password',
#             role: 'organization')
#     end
#     before do
#         user.confirm
#         sign_in(user)
#     end
#     it 'succeeds' do
#         expect(
#         post(
#             :create,
#             params: {
#                 organization: {name: 'FAKE'},
#                 email: 'fake@fake.com',
#                 phone: '13045739394',
#                 primary_name: 'FAKE primary name',
#                 secondary_name: 'FAKE secondary name',
#                 secondary_phone: '13037845463'
#     },
# }
#     )
# ).to redirect_to(organization_application_submitted_path)
# end
#         }
#     )
# )
# end