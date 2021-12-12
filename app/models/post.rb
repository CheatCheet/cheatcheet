# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :stack

  has_rich_text :body
  has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 5 }

  default_scope { order(created_at: :desc) }
  scope :from_user, ->(id) { where('user_id = ?', id) }
  scope :related_to, lambda { |value|
                       joins(:action_text_rich_text, :stack).where("posts.title ILIKE '%#{value}%' OR
                      action_text_rich_texts.body ILIKE '%#{value}%' OR stacks.name ILIKE '%#{value}%'")
                     }

  def bookmark_id(user_id)
    bookmarks.find_by(user_id: user_id)
  end
end
