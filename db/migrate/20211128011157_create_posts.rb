# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,         null: false, default: ''
      t.text :body,            null: false, default: ''
      t.boolean :public,       default: true
      t.references :user,      foreign_key: true

      t.timestamps null: false
    end
  end
end
