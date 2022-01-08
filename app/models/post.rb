# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :tags
  has_rich_text :body

  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 5 }

  default_scope { order(created_at: :desc) }
  scope :from_user, ->(id) { where('user_id = ?', id) }
end
