require 'rails_helper'

RSpec.describe Ticket, type: :model do
	
	describe 'properties' do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:description) }
		it { is_expected.to respond_to(:phone) }
		it { is_expected.to respond_to(:closed) }
		it { is_expected.to respond_to(:closed_at) }
	end

	describe 'relationships' do
		#TODO update rspec version
		#it { is_expected.to belong_to(:organization).optional }
		it { is_expected.to belong_to(:region) }
		it { is_expected.to belong_to(:resource_category) }

	end

	describe 'validations' do
		it { is_expected.to validate_presence_of(:name)}
		it { is_expected.to validate_presence_of(:phone)}
		it { is_expected.to validate_presence_of(:region_id)}
		it { is_expected.to validate_presence_of(:resource_category_id)}
		
		it { is_expected.to validate_length_of(:name).is_at_least(1)}
		it { is_expected.to validate_length_of(:name).is_at_most(255)}

		it { is_expected.to validate_length_of(:description).is_at_most(1020)}

		# it "validates phone number" do
		#   ticket = ticket() # invokes the `let`
		#   expect(ticket).to be_valid
		#   ticket.phone = "INVALID"
		#   expect(ticket).to_not be_valid
		# end
	end

	# describe 'scopes' do
	# 	describe 'open' do
	# 		it 'includes open tickets but not closed tickets' do
	# 			open_ticket = Ticket.create(closed: false, organization: nil, name: "name", phone: "1112223333", region: Region.new, resource_category_id: 12, closed_at: nil )
	# 			closed_ticket = Ticket.create(closed: true, organization: nil, name: "name", phone: "1112223333", region: Region.new, resource_category_id: 12, closed_at: nil )

	# 			open_tickets = Ticket.open 
	# 			closed_tickets = Ticket.closed

	# 			expect(open_tickets).to include(open_ticket)
	# 			expect(open_tickets).not_to include(closed_ticket)
	# 		end

	# 		it 'includes closed tickets but not open tickets' do
	# 			open_ticket = Ticket.create(closed: false, organization: nil, name: "name", phone: "1112223333", region: Region.new, resource_category_id: 12, closed_at: nil )
	# 			closed_ticket = Ticket.create(closed: true, organization: nil, name: "name", phone: "1112223333", region: Region.new, resource_category_id: 12, closed_at: nil )

	# 			open_tickets = Ticket.open
	# 			closed_tickets = Ticket.closed

	# 			expect(closed_tickets).to include(closed_ticket)
	# 			expect(closed_tickets).not_to inclued(open_tickets)
	# 		end
	# 	end
		
		# describe 'organization' do
		# 	it 'includes an orgainization with an open ticket' do
		# 		ticket_with_organization = Ticket.create(closed: false, organization: 'Fake Organization')
		# 		closed_ticket_with_organization = Ticket.create(closed: true, organization: 'Fake Organization')

		# 		tickets_with_org = Ticket.all_organization
		# 		closed_tickets_with_org = Ticket.

		# 		expect(ticket_with_organization).to include(ticket_with_organization)
		# 	end

		# end
	# end

	describe '#open?' do
		it "is open by default" do
			expect(Ticket.new).to be_open
		end
		specify "an open ticket is not closed" do
			ticket = Ticket.new
			expect(ticket).to_not be_closed
		end
	end

	describe "#captured?" do
	  it "does not raise" do
	    expect { Ticket.new.captured? }.not_to raise_error
	  end
	end

	describe "#to_s" do
	  it "does not raise" do
	    expect { Ticket.new.to_s }.not_to raise_error
	  end
	end
	
end
