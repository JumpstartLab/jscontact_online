require 'spec_helper'

describe User do
  let(:user) { Fabricate(:user) }
  let(:person) { Fabricate(:person, :user_id => user.id) }
  let(:company) { Fabricate(:company, :user_id => user.id) }
  
  it "should associate with people" do    
    user.people << person
    user.people.should include(person)
  end

  it "should associate with companies" do    
    user.companies << company
    user.companies.should include(company)
  end
end
