# frozen_string_literal: true

class Stack < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, uniqueness: true

  def self.default
    find_by(name: 'Ruby / Ruby On Rails')
  end
end
