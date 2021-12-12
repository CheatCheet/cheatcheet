# frozen_string_literal: true

module Bookmarks
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = Post.bookmarked(current_user)
    end
  end
end
