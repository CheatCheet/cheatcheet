# frozen_string_literal: true

module Users
  class PostsController < ApplicationController
    include Posts::Pagination
    include Posts::SetBookmarks

    # load_and_authorize_resource ?
    # REF: https://stackoverflow.com/questions/30840231/cancan-explanation-of-load-and-authorize-resource
    before_action :authenticate_user!

    def index
      @posts = Post.with_all_inclusions.from_user(current_user.id)
      set_paginated_posts
      set_bookmarks
    end
  end
end
