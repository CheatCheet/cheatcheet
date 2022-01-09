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

def post_body
  url = 'https://loripsum.net/api/1/short/code/bq/link/decorate'
  URI.parse(url).open.read
end

warn '==> Running stacks finding or creation'
create_stacks
warn '==> End of stacks finding or creation'

if Rails.env.development?
  warn '==> Running development environnement seed'
  3.times do |number|
    pseudo = "user_#{number}"
    create_user({ pseudo: pseudo, email: "#{pseudo}@example.com" })
  end

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
