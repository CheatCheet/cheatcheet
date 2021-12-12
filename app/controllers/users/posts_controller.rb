# frozen_string_literal: true

module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = Post.from_user(current_user.id)
    end
  end
end
