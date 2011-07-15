require 'spec_helper'

describe "the views for people", :type => :request do
  let(:user){ Fabricate(:user) }
  let(:person){ Fabricate(:person, :user_id => user.id) }
  let(:people) { [Fabricate(:person, :user_id => user.id), 
                  Fabricate(:person, :user_id => user.id)] }

  context "when listing the people" do
    before(:all) do
      people
    end
    
    before(:each) do
      login_as(user)
      visit login_path
      visit people_path
    end
  
    it "should list people associated with this user" do
      person = Fabricate(:person, :user_id => user.id)
      person.save!
      user.people.count.should > 0
      person.user.should == user 
      visit people_path
      save_and_open_page
      user.people.each do |person|
        page.should have_content(person.last_name)
        page.should have_content(person.first_name)
      end
    end
    
    it "should not list people associated with another user" do
      person = Fabricate(:person)
      visit people_path
      page.should_not have_content(person.last_name)
      page.should_not have_content(person.first_name)
    end
  
    it "should list the phone numbers" do
      people.each do |person|
        person.phone_numbers.each do |phone_number|
          page.should have_content(phone_number.number)
        end
      end
    end
  end
  
  context "when looking at a person" do
    before(:each) do
      visit person_path(person)
    end
        
    let(:phone_number) { person.phone_numbers.first }
    
    context "and they have a mugshot" do
      it "should display the image" do
        if person.mugshot?
          page.should have_selector("img#mugshot")
        end
      end      
    end
    
    it "should display each phone number" do
      person.phone_numbers.each do |phone_number|
        page.should have_content(phone_number.number)
      end
    end
    
    it "should have edit links for each phone number" do
      person.phone_numbers.each do |phone_number|    
        page.should have_link(dom_id(phone_number, :edit))
      end
    end
    
    it "should have a delete link for each phone number" do
      person.phone_numbers.each do |phone_number|    
        page.should have_link(dom_id(phone_number, :delete))
      end
    end
    
    context "when I click the delete link for a number" do
      before(:each) do
        click_link(dom_id(phone_number, :delete))
      end
      
      it "should display the person show page" do
        current_path.should == person_path(person)
      end
      
      it "should not display the deleted number" do
        page.should_not have_content(phone_number.number)
      end
    end
    
    context "when I click the Add a Phone Number link" do
      before(:each) do
        click_link("new_phone_number")
      end
      
      it "should display the new phone number page" do
        current_path.should == new_phone_number_path
      end
    end
    
    context "when I click on the edit link for a number" do
      before(:each) do
        page.click_link(dom_id(phone_number, :edit))
      end
      
      it "should show the edit form" do
        current_path.should == edit_phone_number_path(phone_number)
      end
    end
  end
  
  context "when editing a person" do
    before(:each) do
      visit edit_person_path(person)
    end

    it "should have a file field for mugshot" do
      page.should have_field("person_mugshot_attributes_photo")
    end
  end
  
  context "when creating a person" do
    before(:each) do
      visit new_person_path
    end
        
  end
end