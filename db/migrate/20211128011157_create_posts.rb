# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,         null: false, default: ''
      t.text :body,            null: false, default: ''
      t.string :env,           null: false, default: ''
      t.boolean :is_published, default: true
      t.references :user

      t.timestamps null: false
    end
  end
end
