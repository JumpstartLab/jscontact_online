Fabricator(:person) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  phone_numbers!(:count => 3) { |person, i| Fabricate(:phone_number, :person => person) }
end