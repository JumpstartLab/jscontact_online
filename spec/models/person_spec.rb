require 'spec_helper'

describe Person do
  let(:person) { Fabricate(:person) }

  it "should be valid" do
    person.should be_valid
  end
  
  it "should not be valid without a first name" do
    person.first_name = nil
    person.should_not be_valid 
  end
  
  it "should not be valid without a last name" do
    person.last_name = nil
    person.should_not be_valid
  end
  
  it "should have an array of phone numbers" do
    person.phone_numbers.should be_instance_of(Array)
  end
  
  it "should have a mugshot" do
    person.should respond_to(:mugshot)
  end
  
  it "should not be valid without a user_id" do
    person.user_id = nil
    person.should_not be_valid
  end
  
end
