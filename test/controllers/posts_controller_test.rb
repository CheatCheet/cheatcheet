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
    post_params = fake_post_params
    assert_changes -> { Post.count } do
      sign_in users(:post_owner)
      post posts_url, params: { post: post_params }

      # NOTE: Post newly created is the first post
      compare_post_to_post_params(Post.first, post_params)
    end
  end

  test 'can update a post' do
    post_params = fake_post_params
    post = Post.first

    assert_changes -> { Post.first.title }, post_params[:title] do
      sign_in users(:post_owner)
      patch post_url(Post.first), params: { post: post_params }
    end

    post.reload
    compare_post_to_post_params(post, post_params)
  end

  test 'can destroy a post' do
    assert_changes -> { Post.count }, -1 do
      sign_in users(:post_owner)
      delete post_url(Post.first)
    end
  end

  test 'cannot access to the post creation page' do
    get new_post_url

    assert_redirected_to new_user_session_url
  end

  test "cannot update a post if the user is not it's owner" do
    sign_in users(:post_reader)

    get edit_post_url(Post.first)

    assert_redirected_to root_url
  end

  test "cannot delete a post if the user is not it's owner" do
    sign_in users(:post_reader)

    delete post_url(Post.first)
    assert_redirected_to root_url
  end

  test 'can destroy a post if admin' do
    assert_changes -> { Post.count }, -1 do
      sign_in users(:admin)
      delete post_url(Post.first)
    end
  end

  test 'cannot show a private post' do
    sign_in users(:post_reader)

    get post_url(posts(:private))

    assert_redirected_to root_url
    assert_equal 'You are not authorized to access this page.', flash[:alert]
  end

  private

  def fake_post_params
    {
      title: Faker::Lorem.question,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
      user_id: users(:post_owner).id,
      stack_id: stacks(:ruby_on_rails).id
    }
  end

  def compare_post_to_post_params(post, post_params)
    assert_equal post.title, post_params[:title]
    assert_equal post.user_id, post_params[:user_id]
    assert_includes post.body.body.to_s, post_params[:body]
  end
end
