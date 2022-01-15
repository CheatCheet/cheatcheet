# frozen_string_literal: true

module Users
  class PostsController < ApplicationController
    include Posts::BookmarkId
    before_action :authenticate_user!

    def index
      @posts = Post.from_user(current_user.id)
      set_posts_bookmark_id
    end
  end
end
