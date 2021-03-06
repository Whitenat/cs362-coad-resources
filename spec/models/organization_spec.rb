require 'rails_helper'

RSpec.describe Organization, type: :model do
	let(:organization) {Organization.new}
	describe "Attributes" do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:status) }
		it { is_expected.to respond_to(:phone) }
		it { is_expected.to respond_to(:email) }
		it { is_expected.to respond_to(:description) }
		it { is_expected.to respond_to(:rejection_reason) }
		it { is_expected.to respond_to(:created_at) }
		it { is_expected.to respond_to(:updated_at) }
		it { is_expected.to respond_to(:liability_insurance) }
		it { is_expected.to respond_to(:primary_name) }
		it { is_expected.to respond_to(:secondary_name) }
		it { is_expected.to respond_to(:secondary_phone) }
		it { is_expected.to respond_to(:title) }
		it { is_expected.to respond_to(:transportation) }
		it { is_expected.to respond_to(:email) }
		it { is_expected.to respond_to(:name) }
	end

	describe "Relationships" do
		it { is_expected.to have_many(:users) }
		it { is_expected.to have_many(:tickets) }
		it { is_expected.to have_and_belong_to_many(:resource_categories) }
	end

	describe "Validations" do
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:phone) }
		it { is_expected.to validate_presence_of(:status) }
		it { is_expected.to validate_presence_of(:primary_name) }
		it { is_expected.to validate_presence_of(:secondary_name) }
		it { is_expected.to validate_presence_of(:secondary_phone) }
		it { is_expected.to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
		it { is_expected.to allow_value('email@fake.com').for(:email) }
		it { is_expected.to_not allow_value('fake.com', 'butts').for(:email) }
		it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
		it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
		it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
		it { is_expected.to validate_length_of(:description).is_at_most(1020).on(:create) }
	end
	describe "approve" do
		it "does not raise" do
		  expect { Organization.new.approve() }.not_to raise_error
		end
  end

  describe "reject" do
		it "does not raise" do
		  expect { Organization.new.reject() }.not_to raise_error
		end
  end

	describe "#to_s" do
		it "does not raise" do
		  expect { Organization.new.to_s }.not_to raise_error
		end
  end


end