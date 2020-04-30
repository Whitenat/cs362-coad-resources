require 'rails_helper'



RSpec.describe Region, type: :model do
let(:region) {FactoryBot.build(:region) }
let(:unspecified_region) {FactoryBot.build(:region) }

	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:created_at) }
	it { is_expected.to respond_to(:updated_at) }
# it 'exists' do
# 	Region = Region.new
# end
end
