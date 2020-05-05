require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	describe 'properties' do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:created_at) }
		it { is_expected.to respond_to(:updated_at) }
		it { is_expected.to respond_to(:active) }
	end

	describe 'relationships' do
		it { is_expected.to belong_to(:organizations) }
	end

	describe 'validations' do

	end

	describe 'scopes' do

	end

end
