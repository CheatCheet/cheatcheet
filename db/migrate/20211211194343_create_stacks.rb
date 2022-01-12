# frozen_string_literal: true

class CreateStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :stacks do |t|
      t.string :name

      t.timestamps
    end

    add_index :stacks, :name, unique: true
    add_reference :posts, :stack, foreign_key: true
  end
end
