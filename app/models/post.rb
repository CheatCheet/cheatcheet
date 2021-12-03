# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  scope :from_user, ->(id) { where('user_id = ?', id) }
end
