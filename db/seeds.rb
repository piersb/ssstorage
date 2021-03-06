I18n.reload!

User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

# avfiles
users = User.order(:created_at).take(6)
30.times do
  title = Faker::Book.title
  users.each {|user| user.avfiles.create!(title: title, s3reference: title.parameterize)}
end


# following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each{ |followed| user.follow(followed) }
followers.each{ |follower| follower.follow(user) }


