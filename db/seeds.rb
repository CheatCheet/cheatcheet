# frozen_string_literal: true

def create_user(params)
  User.create!(params.merge(password: 'password'))
end

def post_body
  url = 'https://loripsum.net/api/1/short/code/bq/link/decorate'
  URI.parse(url).open.read
end

if Rails.env.development?
  warn '==> Running development environnement seed'
  3.times do |number|
    pseudo = "user_#{number}"
    create_user({ pseudo: pseudo, email: "#{pseudo}@example.com" })
  end

  3.times { |_number| Stack.create(name: Faker::ProgrammingLanguage.name) }

  15.times do
    Post.create(
      title: Faker::Lorem.question,
      body: post_body,
      user_id: User.ids.sample,
      stack_id: Stack.ids.sample
    )
  end

  create_user({ pseudo: 'admin', email: 'admin@example.com', admin: true })
  warn '==> End of development environnement seed'
end
