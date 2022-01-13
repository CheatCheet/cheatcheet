# frozen_string_literal: true

class BookmarksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    render_bookmark_button if Bookmark.create(user: current_user, post: @post)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post
    render_bookmark_button if @bookmark.destroy
  end

  private

  def render_bookmark_button
    render turbo_stream: turbo_stream.update("bookmark_#{@post.id}",
                                             partial: 'bookmarks/bookmark',
                                             locals: {
                                               user: current_user,
                                               post: @post
                                             })
  end
end
