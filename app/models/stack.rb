# frozen_string_literal: true

class Stack < ApplicationRecord
  has_many :posts, dependent: nil

  validates :name, uniqueness: true

  def self.ruby_on_rails
    find_by(name: 'Ruby / Ruby On Rails')
  end
end
