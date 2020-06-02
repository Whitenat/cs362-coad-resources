require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

	context 'As a public user' do
		let(:user) { create(:user)}

		specify 'GET #new' do
      expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
      expect(post(:create, params:{ticket: attributes_for(:ticket)})).to be_successful
    end

    specify 'GET #show' do
    	ticket = create(:ticket)
      sign_in(user)
    	expect(get(:show, params: {id: ticket.id})).to redirect_to(dashboard_path)
    end

    specify 'POST #capture' do
    	ticket = create(:ticket)
      sign_in(user)
    	expect(post(:capture, params: {id: ticket.id})).to redirect_to(dashboard_path)
    end

    specify 'POST #release' do
    	ticket = create(:ticket)
      sign_in(user)
    	expect(post(:release, params: {id: ticket.id})).to redirect_to(dashboard_path)
    end

    specify 'PATCH #close' do
    	ticket = create(:ticket)
      sign_in(user)
    	expect(patch(:close, params: {id: ticket.id})).to redirect_to(dashboard_path)
    end

    specify 'DELETE #destroy' do
    	expect(delete(:destroy, params: {id: 'FAKE'})).to redirect_to(dashboard_path)
    end
	end

	context 'As an organization user' do


	end

	context 'As an admin user' do
		let(:user) { create(:user, :admin)}

		specify 'GET #new' do
      expect(get(:new)).to be_successful
    end

    specify 'POST #create' do
      expect(post(:create, params:{ticket: attributes_for(:ticket)})).to be_successful
    end

    specify 'GET #show' do
    	ticket = create(:ticket)
      sign_in(user)
    	expect(get(:show, params: {id: ticket.id})).to be_successful
    end

    # specify 'POST #capture' do
    # 	ticket = create(:ticket, :approved)
    #   sign_in(user)
    # 	expect(post(:capture, params: {id: ticket.id})).to redirect_to(dashboard_path)
    # end

    # specify 'POST #release' do
    # 	ticket = create(:ticket)
    #   sign_in(user)
    # 	expect(post(:release, params: {id: ticket.id})).to redirect_to(dashboard_path)
    # end

    # specify 'PATCH #close' do
    # 	ticket = create(:ticket)
    #   sign_in(user)
    # 	expect(patch(:close, params: {id: ticket.id})).to redirect_to(dashboard_path)
    # end

    # specify 'DELETE #destroy' do
    # 	expect(delete(:destroy, params: {id: 'FAKE'})).to redirect_to(dashboard_path)
    # end
	end

end
