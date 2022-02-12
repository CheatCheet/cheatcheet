# frozen_string_literal: true

require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:post_owner)
    @post = posts(:default)
    sign_in @user
  end

  test 'it should create an upvote' do
    assert_difference -> { @post.get_upvotes.size } do
      create_vote
    end
  end

  test 'it should create a downvote' do
    assert_difference -> { @post.get_downvotes.size } do
      create_vote('down')
    end
  end

  test 'it should update a vote' do
    create_vote
    assert_no_difference -> { @post.get_upvotes.size } do
      create_vote
    end
  end

  private

  def create_vote(value = 'up')
    post post_votes_url(@post, params: { post: { vote: value } }, format: :turbo_stream)

    assert_response :success
  end
end
