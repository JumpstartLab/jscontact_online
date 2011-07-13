require 'spec_helper'

describe "the views for phone_numbers", :type => :request do
  before(:each) do
    @person = Person.create(:first_name => "Daffy", :last_name => "Duck")
    @phone_number = @person.phone_numbers.create(:number => "2223334444")
  end
  
  context "when on the edit form" do
    before(:each) do
      visit edit_phone_number_path(@phone_number)
    end
    
    it "should show the person after clicking the update button" do
      click_link_or_button("phone_number_submit")
      current_path.should == person_path(@person)
    end
  end
  
  # Challenge:
  # When on the new form:
  # to check that creating a phone number brings you back to the person
  # and that the phone number is listed
end