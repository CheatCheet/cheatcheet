# frozen_string_literal: true

module Bookmarks
  class PostsController < ApplicationController
    include Posts::Pagination
    include Posts::SetBookmarks

    load_and_authorize_resource
    before_action :authenticate_user!

    def index
      @posts = Post.with_all_inclusions.bookmarked(current_user)
      set_paginated_posts
      set_bookmarks
    end
  end
end
