# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 5 }
  scope :from_user, ->(id) { where('user_id = ?', id) }
end
