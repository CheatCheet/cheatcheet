# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[github]

  validates :email, :pseudo, uniqueness: true

  has_many :posts, dependent: :nullify

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.user_details_from_github(auth)
    end
  end

  def user_details_from_github(auth)
    self.provider = auth.provider
    self.email = auth.info.email
    self.pseudo = auth.info.nickname
    self.uid = auth.uid
    self.password = Devise.friendly_token[0, 20]
  end
end
