require File.dirname(__FILE__) + '/../spec_helper'

describe PhoneNumber do
  let(:phone_number) do
    person = Fabricate(:person)
    person.phone_numbers.first
  end
  
  it "should be valid" do
    phone_number.should be_valid
  end
  
  it "should not be valid without a number" do
    phone_number.number = nil
    phone_number.should_not be_valid
  end
  
  it "should be associated with a person" do
    phone_number.person.should be_instance_of(Person)
  end
end
