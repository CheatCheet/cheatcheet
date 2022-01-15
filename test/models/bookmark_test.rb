# frozen_string_literal: true

require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  test 'it destroys the bookmark by destroying the post' do
    assert_changes -> { Bookmark.count }, -1 do
      bookmarks(:default).post.destroy
    end
  end
  test 'it doesn t create a bookmark for same post and same user' do
    assert_no_changes -> { Bookmark.count } do
      default = bookmarks(:default)
      Bookmark.create(user_id: default.user_id,
                      post_id: default.post_id)
    end
  end
  test 'it  creates a bookmark' do
    assert_changes -> { Bookmark.count }, 1 do
      default = bookmarks(:default)
      potential_user_ids = User.ids - [default.user_id]
      Bookmark.create(user_id: potential_user_ids.sample,
                      post_id: default.post_id)
    end
  end
end
