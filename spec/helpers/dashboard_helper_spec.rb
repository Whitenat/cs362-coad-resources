require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

	describe DashboardHelper do

	  describe "dashboard_for" do
	    it "sends admin user to admin dashboard" do
	    	adminUser = User.new(role: "admin") 
	      expect(helper.dashboard_for(adminUser)).to eq("admin_dashboard")
	    end

	    it "sends submitted organizations to submitted dash" do
	    	submittedOrganization = User.new(role: "organization", organization: Organization.new) 
	      expect(helper.dashboard_for(submittedOrganization)).to eq("organization_submitted_dashboard")
	    end

	    it "sends approved organizations to approved dash" do
	    	organization = Organization.new(status: "approved")
	    	approvedOrganization = User.new(role: "organization", organization: organization)
	      expect(helper.dashboard_for(approvedOrganization)).to eq("organization_approved_dashboard")
	    end

	    it "sends unknown users to default dash" do
	      expect(helper.dashboard_for(User.new)).to eq("create_application_dashboard")
	    end
	  end

	end

end
