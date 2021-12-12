# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :find_post, only: %i[create]
  before_action :find_bookmark, only: %i[destroy]

  def create
    bookmark = Bookmark.new(user: current_user, post: @post)
    if bookmark.save
      flash[:success] = 'Bookmark successfully created'
    else
      flash.now[:error] = 'Something went wrong'
    end
    render_flash
  end

  def destroy
    if @bookmark.destroy
      flash[:success] = 'Bookmark successfully deleted'
    else
      flash.now[:error] = 'Something went wrong'
    end
    render_flash
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
