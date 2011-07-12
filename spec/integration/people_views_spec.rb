require 'spec_helper'
require 'capybara/rspec'

describe "the views for people", :type => :request do
  
  context "when looking at a person" do
    before(:all) do
      @person = Person.create(:first_name => "Daffy", :last_name => "Duck")
      @person.phone_numbers.create(:number => "2223334444")
      @person.phone_numbers.create(:number => "5556667777")
      visit person_path(@person)
    end
    
    it "should display each phone number" do
      @person.phone_numbers.each do |phone_number|
        page.should have_content(phone_number.number)
      end
    end
    
    it "should have edit links for each phone number"
  end
end