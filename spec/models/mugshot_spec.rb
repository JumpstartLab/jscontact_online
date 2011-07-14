require 'spec_helper'

describe Mugshot do
  let(:mugshot){ Fabricate(:mugshot) }
  
  it "should be attached to a contact" do
    mugshot.should respond_to(:contact)
  end
end
