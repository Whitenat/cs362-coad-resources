require 'rails_helper'

RSpec.describe Region, type: :model do

	let(:region) {FactoryBot.build(:region) }
	let(:unspecified_region) {FactoryBot.build(:region) }

	describe 'properties' do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:created_at) }
		it { is_expected.to respond_to(:updated_at) }
	end

	describe "relationships" do
		it {is_expected.to have_many(:tickets)}
	end

	describe "validations" do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_length_of(:name).is_at_least(1)}
		it { is_expected.to validate_length_of(:name).is_at_most(255)}
		it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
	end

end


	
