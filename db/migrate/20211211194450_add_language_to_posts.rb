# frozen_string_literal: true

class AddLanguageToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :language, foreign_key: true
  end
end
