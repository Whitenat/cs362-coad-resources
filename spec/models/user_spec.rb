require 'rails_helper'

RSpec.describe User, type: :model do
	it { is_expected.to respond_to(:email) }
	it { is_expected.to respond_to(:encrypted_password) }
	it { is_expected.to respond_to(:reset_password_token) }
 
end
