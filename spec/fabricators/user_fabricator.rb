Fabricator(:user) do
  provider!{ "sample" }
  uid!{ sequence(:uid) }
  name!{ Faker::Name.name}
end
