require 'rails_helper'



RSpec.describe Region, type: :model do
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:created_at) }
	it { is_expected.to respond_to(:updated_at) }
# it 'exists' do
# 	Region = Region.new
# end
end
