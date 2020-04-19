require 'rails_helper'

RSpec.describe Ticket, type: :model do
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:description) }
	it { is_expected.to respond_to(:phone) }
	it { is_expected.to respond_to(:organization_id) }
	it { is_expected.to respond_to(:created_at) }
	it { is_expected.to respond_to(:updated_at) }
	it { is_expected.to respond_to(:closed) }
	it { is_expected.to respond_to(:region_id) }
	it { is_expected.to respond_to(:resource_category_id) }

end
