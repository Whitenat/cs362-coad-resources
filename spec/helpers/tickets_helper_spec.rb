require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
    describe "format_phone_number" do
        it "Validates a Normal Number" do
            expect(helper.format_phone_number("321-794-0137")).to eq("+13217940137")
		end
  	end
end
