# frozen_string_literal: true

require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can get list of bookmarks if signed in' do
    sign_in users(:post_reader)
    get bookmarks_posts_url

    assert_response :success
  end

  test 'cannot get list of bookmarks unless signed in' do
    get bookmarks_posts_url

    assert_redirected_to new_user_session_url
  end

  test 'can bookmark a post if logged in' do
    assert_changes -> { Bookmark.count }, 1 do
      sign_in users(:post_reader)
      post post_bookmarks_url(posts(:default))

      assert_response :success
    end
  end

  test 'cannot bookmark a post unless logged in' do
    post post_bookmarks_url(posts(:default))

    assert_redirected_to new_user_session_url
  end

  test 'can remove a bookmark a post already bookmarked' do
    assert_changes -> { Bookmark.count }, -1 do
      sign_in users(:post_reader)
      delete bookmark_url(bookmarks(:default))

      assert_response :success
    end
  end

  test 'cannot remove a bookmark a post unless signed in' do
    delete bookmark_url(bookmarks(:default))

    assert_redirected_to new_user_session_url
  end
end
