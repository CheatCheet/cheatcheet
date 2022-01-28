# frozen_string_literal: true

module Bookmarks
  class PostsController < ApplicationController
    include Posts::BookmarkId
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
      @posts = Post.includes(:stack).with_rich_text_body.bookmarked(current_user)
      set_posts_bookmark_id
    end
  end
end
