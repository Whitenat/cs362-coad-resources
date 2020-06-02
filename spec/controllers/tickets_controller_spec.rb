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

	class FakeTicketService

			def capture_ticket
				return :ok
			end

			def release_ticket
				return :ok
			end

			def close_ticket
				return :ok
			end

	end

	context 'As an organization user' do
		let(:user) { create(:user)}

		specify 'POST #capture' do
    	ticket = create(:ticket)
			user.organization = create(:organization, :approved)
			user.save
			sign_in(user)
      allow(TicketService).to receive(:capture_ticket).and_return FakeTicketService.new
    	expect(post(:capture, params: {id: ticket.id})).to be_successful
    end

    specify 'POST #release' do
    	ticket = create(:ticket)
    	user.organization = create(:organization, :approved)
			user.save
      sign_in(user)
      allow(TicketService).to receive(:release_ticket).and_return FakeTicketService.new
    	expect(post(:release, params: {id: ticket.id})).to be_successful
    end

    specify 'PATCH #close' do
    	ticket = create(:ticket)
    	user.organization = create(:organization, :approved)
			user.save
      sign_in(user)
      allow(TicketService).to receive(:close_ticket).and_return FakeTicketService.new
    	expect(patch(:close, params: {id: ticket.id})).to be_successful
    end


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

   #  specify 'POST #capture' do
   #  	ticket = create(:ticket)
			# user.organization = create(:organization, :approved)
			# user.save
   #    allow(TicketService).to receive(:capture_ticket).and_return FakeTicketService.new
   #  	expect(post(:capture, params: {id: ticket.id})).to redirect_to(dashboard_path << '#tickets:open')
   #  end

    specify 'POST #release' do
    	ticket = create(:ticket)
    	user.organization = create(:organization, :approved)
			user.save
      sign_in(user)
      allow(TicketService).to receive(:release_ticket).and_return FakeTicketService.new
    	expect(post(:release, params: {id: ticket.id})).to be_successful
    end

    # specify 'PATCH #close' do
    # 	ticket = create(:ticket)
    #   sign_in(user)
    # 	expect(patch(:close, params: {id: ticket.id})).to redirect_to(dashboard_path)
    # end

    specify 'DELETE #destroy' do
    	ticket = create(:ticket)
    	sign_in(user)
    	expect(delete(:destroy, params: {id: ticket})).to redirect_to(dashboard_path << '#tickets')
    end
	end

end
