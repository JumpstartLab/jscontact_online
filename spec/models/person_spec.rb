require 'spec_helper'

describe Person do
  
  let(:person) do
    Person.new(:first_name => "Daffy",
               :last_name => "Duck")
  end
  
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
end
