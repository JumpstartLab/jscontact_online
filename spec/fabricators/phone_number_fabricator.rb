Fabricator(:phone_number) do
  number { sequence(:pn, 8887776666) }
end