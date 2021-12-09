# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can get list of posts' do
    get posts_url
    assert_response :success
  end

  test 'can show a post' do
    get post_url(posts(:default))
    assert_response :success
  end

  test 'can create a post' do
    assert_changes -> { Post.count } do
      sign_in users(:default)
      post posts_url, params: {
        post: {
          title: Faker::Lorem.question,
          body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
          user_id: users(:default).id
        }
      }
    end
  end

  test 'can update a post' do
    assert_changes -> { Post.first.title } do
      sign_in users(:default)
      patch post_url(Post.first), params: {
        post: { title: 'New title' }
      }
    end
  end

  test 'can destroy a post' do
    assert_changes -> { Post.count }, -1 do
      sign_in users(:default)
      delete post_url(Post.first)
    end
  end

  test 'cannot access to the post creation page' do
    get new_post_url
    assert_redirected_to new_user_session_url
  end

  test "cannot update a post if the user is not it's owner" do
    sign_in users(:default2)

    get edit_post_url(Post.first)
    assert_redirected_to root_url
  end

  test "cannot delete a post if the user is not it's owner" do
    sign_in users(:default2)

    delete post_url(Post.first)
    assert_redirected_to root_url
  end

  test 'can destroy a post if admin' do
    assert_changes -> { Post.count }, -1 do
      sign_in users(:admin)
      delete post_url(Post.first)
    end
  end
end
