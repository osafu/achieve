Faker::Config.locale = :ja

100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  avatar = ""
  provider = ""
  image_url = "no_image.png"

  User.create!(
                name: name,
                email: email,
                password: password,
                password_confirmation: password,
                provider: provider,
                image_url: image_url
              )

end

100.times do |n|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.sentence
  Blog.create!(
                title: title,
                content: content,
                user_id: n + 1
              )

end
