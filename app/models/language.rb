# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :posts, dependent: nil

  validates :name, uniqueness: true
end
