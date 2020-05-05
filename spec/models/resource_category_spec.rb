require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	describe 'properties' do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:created_at) }
		it { is_expected.to respond_to(:updated_at) }
		it { is_expected.to respond_to(:active) }
	end

	describe 'relationships' do
		it { is_expected.to have_and_belong_to_many(:organizations) }
		it { is_expected.to have_many(:tickets) }
	end

	describe 'validations' do
		it { is_expected.to validate_presence_of(:name)}
		it { is_expected.to validate_length_of(:name).is_at_least(1)}
		it { is_expected.to validate_length_of(:name).is_at_most(255)}
		it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
	end

	describe 'scopes' do

	end

	describe '#inactive?' do
		it "is active by default" do
			expect(ResourceCategory.new).to be_active
		end
	end

	describe "#to_s" do
	it "does not raise" do
	  expect { ResourceCategory.new.to_s }.not_to raise_error
	end
  end

	describe "::unspecified" do	
		it "creates a new Unspecified resource_category when one does not exist" do
			expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
			expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }
		end
		# it "does not create a new Unspecified resource_category when one already exists" do
		# 	FactoryBot.create(:resource_category, :unspecified)
		# 	expect{ ResourceCategory.unspecified }.to_not change { ResourceCategory.count }
		# end
		it "does not create a new Unspecified resource_category when one already has one" do
			expect(ResourceCategory.unspecified.name).to eq('Unspecified')
		end
	end

end
