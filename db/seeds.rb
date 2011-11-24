[{email: "dimroc@gmail.com", password: "test"}].each do |entry|
  User.create(
      email: entry[:email],
      password: entry[:password],
      admin: true)
end