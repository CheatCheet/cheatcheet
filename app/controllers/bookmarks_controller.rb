# frozen_string_literal: true

class BookmarksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    bookmark = Bookmark.new(user: current_user, post: @post)
    if bookmark.save
      @post.bookmark_id = bookmark.id
      render_bookmark_button
    else
      render_error
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post

    if @bookmark.destroy
      render_bookmark_button
    else
      render_error
    end
  end

  private

  def render_error
    flash.now[:error] = 'Something went wrong. Please try again later'
    render_flash
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
