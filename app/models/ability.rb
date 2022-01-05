# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    # return unless user.present?
    return if user.blank? # additional permissions for logged in users (they can read their own posts)

    can :manage, Post, user: user

    return unless user.admin?  # additional permissions for administrators

    can :manage, Post
  end
end
