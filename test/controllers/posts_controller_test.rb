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
    assert_response :failed
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
    assert_changes -> { Post.count } do
      sign_in users(:default)
      delete post_url(Post.first)
    end
  end
end
