
def login_as(user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] =
    { "provider" => user.provider,
      "uid" => user.id,
      "user_info" => {"name" => user.name}
    }
end