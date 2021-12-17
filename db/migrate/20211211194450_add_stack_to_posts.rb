# frozen_string_literal: true

class AddStackToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :stack, foreign_key: true
  end
end
