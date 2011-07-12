require 'spec_helper'

describe PhoneNumbersHelper do
  context ".print_numbers" do
    it "should output a comma separated list of phone numbers" do
      number_a = PhoneNumber.new(:number => "2223334444")
      number_b = PhoneNumber.new(:number => "5556667777")
      print_numbers([number_a, number_b]).should == "2223334444, 5556667777"
    end
    
    it "should not have a comma when there is only one number" do
      number_a = PhoneNumber.new(:number => "2223334444")
      print_numbers([number_a]).should_not include(",")
    end
  end
end