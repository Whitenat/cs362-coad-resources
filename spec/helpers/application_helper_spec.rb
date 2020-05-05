require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

	describe ApplicationHelper do

	  describe "full_title" do
	    it "gives a default title" do
	      expect(helper.full_title("")).to eq("Disaster Resource Network")
	    end
	    it "concats given title with default title" do
	      expect(helper.full_title("fake page title")).to eq("fake page title | Disaster Resource Network")
	    end
	  end

	end

end
