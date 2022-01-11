# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post, uniqueness: { scope: :user }
end
