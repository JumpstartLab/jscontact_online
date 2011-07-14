require 'spec_helper'

describe "the views for companies" do
  let(:company) { Fabricate(:company) }
  context "on the show page" do
    
    before(:each) do
      visit company_path(company)
    end
    
    it "should go to the new phone number page when the link is clicked" do
      page.click_link_or_button("new_phone_number")
    end
  end
end