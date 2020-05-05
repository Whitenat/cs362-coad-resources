require 'rails_helper'

RSpec.describe Region, type: :model do

	let(:region) {FactoryBot.build(:region) }
	let(:unspecified_region) {FactoryBot.build(:region) }

	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:created_at) }
	it { is_expected.to respond_to(:updated_at) }


	describe "relationships" do
		it {is_expected.to have_many(:tickets)}
	end

	describe "validations" do
		it { is_expected.to validate_presence_of(:name) }
	end
	
end


	
