require 'spec_helper'

describe Company do
  let(:company){ Fabricate(:company) }

  it "should be valid" do
    company.should be_valid
  end

  it "should not be valid without a user_id" do
    company.user_id = nil
    company.should_not be_valid
  end
  
  it "should not be valid without a name" do
    company.name = nil
    company.should_not be_valid
  end
  
  it "should have an array of phone numbers" do
    company.phone_numbers.should be_instance_of(Array)
  end
end
