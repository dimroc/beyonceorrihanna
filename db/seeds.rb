[{email: "dimroc@gmail.com", password: "test"}].each do |entry|
  User.create(
      email: entry[:email],
      password: entry[:password],
      admin: true)

  rihanna = Character.create(name: "Rihanna",
                             caption: "Only girl in the world",
                             youtube_id: "tg00YEETFzg",
                             image_url: "http://www.howmuchdotheyweigh.com/wp-content/uploads/2011/04/Rihanna.jpg",
                             twitter_tags: "@rihanna")

  beyonce = Character.create(name: "Beyonce",
                             caption: "The Real Her",
                             youtube_id: "VBmMU_iwe6U",
                             image_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Beyonce.jpg/414px-Beyonce.jpg",
                             twitter_tags: "@beyonce")

  Rivalry.from_characters([beyonce, rihanna])
end