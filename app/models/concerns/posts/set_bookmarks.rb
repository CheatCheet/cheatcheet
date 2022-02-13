# frozen_string_literal: true

module Posts
  module SetBookmarks
    extend ActiveSupport::Concern

    def set_bookmarks
      @bookmarks = current_user&.bookmarks
    end
  end
end
