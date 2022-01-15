# frozen_string_literal: true

module Posts
  module BookmarkId
    extend ActiveSupport::Concern

    def set_posts_bookmark_id
      return unless current_user

      bookmarks_data = Hash[current_user.bookmarks.pluck(:post_id, :id)]

      @posts.each { |post| post.bookmark_id = bookmarks_data[post.id] }
    end
  end
end
