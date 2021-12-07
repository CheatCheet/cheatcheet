# frozen_string_literal: true

def create_user(params)
  User.create!(params.merge(password: 'password'))
end

def post_body
  "#{Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)}
  \n
  #{Faker::Markdown.block_code}"
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
      body: post_body,
      user_id: User.ids.sample,
      tag_list: Array.new((1..3).to_a.sample) { Faker::ProgrammingLanguage.name }
    )
  end

  create_user({ pseudo: 'admin', email: 'admin@example.com', admin: true })
end
