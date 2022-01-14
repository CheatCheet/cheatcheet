# frozen_string_literal: true

class BookmarksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    render_turbo(Bookmark.create(user: current_user, post: @post))
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post

    render_turbo(@bookmark.destroy)
  end

  private

  def render_turbo(action)
    if action
      render_bookmark_button
    else
      flash.now[:error] = 'Something went wrong. Please try again later'
      render_flash
    end
  end

  def render_bookmark_button
    render turbo_stream: turbo_stream.update("bookmark_options_for_post_#{@post.id}",
                                             partial: 'bookmarks/bookmark_options',
                                             locals: {
                                               user: current_user,
                                               post: @post
                                             })
  end
end
