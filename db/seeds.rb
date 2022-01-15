# frozen_string_literal: true

require 'csv'

def create_stacks
  filepath = 'db/stacks.csv'
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, encoding: 'iso-8859-1:utf-8' }
  CSV.foreach(filepath, **csv_options) { |row| Stack.find_or_create_by(name: row['stack_name']) }
end

def create_user(params)
  User.create!(params.merge(password: 'password'))
end

def post_bodies
  @post_bodies ||=
    10.times.map do |_i|
      url = 'https://loripsum.net/api/1/short/code/bq/link/decorate'
      URI.parse(url).open.read
    end
end

warn '==> Running stacks seeds'
create_stacks
warn '==> End of stacks seeds'

if Rails.env.development?
  warn '==> Running development environnement seed'
  3.times do |number|
    pseudo = "user_#{number}"
    create_user({ pseudo: pseudo, email: "#{pseudo}@example.com" })
  end

  30.times do
    Post.create(
      title: Faker::Lorem.question,
      body: post_bodies.sample,
      user_id: User.ids.sample,
      stack_id: Stack.ids.sample
    )
  end

  admin = create_user({ pseudo: 'admin', email: 'admin@example.com', admin: true })

  3.times do
    Bookmark.create(
      user_id: admin.id,
      post_id: Post.ids.sample
    )
  end

  warn '==> End of development environnement seed'
end
