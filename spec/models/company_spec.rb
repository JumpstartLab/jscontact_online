require 'spec_helper'

describe Company do
  let(:company){ Fabricate(:company) }

  it "should be valid" do
    company.should be_valid
  end
  
  it "should not be valid without a name" do
    company.name = nil
    company.should_not be_valid
  end
end
