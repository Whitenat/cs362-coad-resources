require 'rails_helper'

RSpec.describe User, type: :model do
	it { is_expected.to respond_to(:email) }
	it { is_expected.to respond_to(:encrypted_password) }
	it { is_expected.to respond_to(:reset_password_token) }
	it { is_expected.to respond_to(:reset_password_sent_at) }
	it { is_expected.to respond_to(:remember_created_at) }
	it { is_expected.to respond_to(:created_at) }
	it { is_expected.to respond_to(:updated_at) }
 
end
