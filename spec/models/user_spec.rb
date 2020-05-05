require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'properties' do
		it { is_expected.to respond_to(:email) }
		it { is_expected.to respond_to(:encrypted_password) }
		it { is_expected.to respond_to(:reset_password_token) }
		it { is_expected.to respond_to(:reset_password_sent_at) }
		it { is_expected.to respond_to(:remember_created_at) }
		it { is_expected.to respond_to(:created_at) }
		it { is_expected.to respond_to(:updated_at) }
		it { is_expected.to respond_to(:confirmation_token) }
		it { is_expected.to respond_to(:confirmed_at) }
		it { is_expected.to respond_to(:confirmation_sent_at) }
		it { is_expected.to respond_to(:unconfirmed_email) }
		it { is_expected.to respond_to(:role) }
		it { is_expected.to respond_to(:organization_id) }
	end

	describe 'relationships' do
		#TODO update rspec version
		#it { is_expected.to belong_to(:organization).optional } 
	end

	describe 'validations' do
		it { is_expected.to validate_presence_of(:email)}
		it { is_expected.to validate_length_of(:email).is_at_least(1)}
		it { is_expected.to validate_length_of(:email).is_at_most(255)}
		it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
		it { is_expected.to validate_presence_of(:password)}
		it { is_expected.to validate_length_of(:password).is_at_least(7)}
		it { is_expected.to validate_length_of(:password).is_at_most(255)}
	end

	describe 'scopes' do

	end
end
