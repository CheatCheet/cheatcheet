# frozen_string_literal: true

class Stack < ApplicationRecord
  has_many :posts, dependent: nil

  validates :name, uniqueness: true
end
