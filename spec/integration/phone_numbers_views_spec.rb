require 'spec_helper'

describe "the views for phone_numbers", :type => :request do
  let(:person) { Fabricate(:person) }
  let(:phone_number) { person.phone_numbers.first }
  let(:company) { Fabricate(:company) }
  
  context "when on the edit form" do
    before(:each) do
      visit edit_phone_number_path(phone_number)
    end
    
    it "should show the person after clicking the update button" do
      click_link_or_button("phone_number_submit")
      current_path.should == person_path(person)
    end
  end
  
  # Challenge:
  # When on the new form:
  # to check that creating a phone number brings you back to the person
  # and that the phone number is listed
  
  context "when on the new form" do
    context "when there is a person_id" do
      before(:each) { visit new_phone_number_path(:person_id => person) }
      
      it "should show the person and number after saving the phone number" do
        page.fill_in("phone_number_number", :with => "9998887777")
        page.click_link_or_button("phone_number_submit")
        current_path.should == person_path(person)
        page.should have_content("9998887777")
      end
    end
    
    context "when there is a company_id" do
      before(:each) { visit new_phone_number_path(:company_id => company)}
      
      it "should show the company after saving the phone number" do
        page.fill_in("phone_number_number", :with => "9998887777")
        page.click_link_or_button("phone_number_submit")
        current_path.should == company_path(company)
        page.should have_content("9998887777")
      end
    end
    
    
  
  end
end