# frozen_string_literal: true

class AddConfirmationTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    ## Confirmable
    change_table :users, bulk: true do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
    end
    add_index :users, :confirmation_token, unique: true
  end
end
