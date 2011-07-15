Fabricator(:company) do
  name! { Faker::Company.name }
  user_id! { |person| Fabricate(:user).id }
end
