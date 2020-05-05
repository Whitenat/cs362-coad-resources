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

	# describe "to_s" do
	# 	it "has a string representation that is the name" do
	# 	region = build(:region)
	# 	region.name = 'FAKE'
	# 	expect(region.to_s).to eq('FAKE')
	# 	end
	# end

	describe "::unspecified" do	
		it "creates a new Unspecified region when one does not exist" do
			expect(Region.where(name: 'Unspecified')).to be_empty
			expect{ Region.unspecified }.to change { Region.count }
		end
		# it "does not create a new Unspecified region when one already exists" do
		# 	FactoryBot.create(:region, :unspecified)
		# 	expect{ Region.unspecified }.to_not change { Region.count }
		# end
		it "does not create a new Unspecified region when one already has one" do
			expect(Region.unspecified.name).to eq('Unspecified')
		end
	end
end
		



	
