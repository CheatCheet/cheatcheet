# frozen_string_literal: true

module Posts
  class VotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
      post_params[:vote] == 'up' ? current_user.up_votes(@post) : current_user.down_votes(@post)
    end

    private

    def post_params
      params.require(:post).permit(:vote)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
