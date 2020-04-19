require 'rails_helper'

RSpec.describe Ticket, type: :model do
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:phone) }
	it { is_expected.to respond_to(:region_id) }
	it { is_expected.to respond_to(:resource_category_id) }
	it { is_expected.to respond_to(:description) }
end
