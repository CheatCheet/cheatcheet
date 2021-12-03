# frozen_string_literal: true

def create_user(params)
  User.create!(params.merge(password: 'password'))
end

warn '==> Running development environnement seed'

if Rails.env.development?
  3.times do |number|
    pseudo = "user_#{number}"
    create_user({ pseudo: pseudo, email: "#{pseudo}@example.com" })
  end

  15.times do
    Post.create(
      title: Faker::Lorem.question,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
      user_id: User.ids.sample
    )
  end

  create_user({ pseudo: 'admin', email: 'admin@example.com', admin: true })
end
