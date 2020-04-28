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
		#it { is_expected.to belong_to(:organization) }
		#it { is_expected.to belong_to(:region) }
		it { is_expected.to belong_to(:resource_category) }

	end

	describe 'validations' do
		it { is_expected.to validate_presence_of(:name)}
		#it { is_expected.to validate :name, length: {minimum: 1}}
	end

	describe '#open?' do
		it "is open by default" do
			expect(Ticket.new).to be_open
		end
		specify "an open ticket is not closed" do
			ticket = Ticket.new
			expect(ticket).to_not be_closed
		end
	end

	
end
