# frozen_string_literal: true

class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :set_post, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.includes(:stack).accessible_by(current_ability).with_rich_text_body_and_embeds
    @posts = @posts.from_user(params[:user_id]) if params[:user_id]
    @posts = @posts.related_to(params[:filter]) if params[:filter]
  end

  def show; end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash.now[:error] = @post.errors.full_messages
      render_flash
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:success] = 'Post was successfully updated'
    else
      flash.now[:error] = @post.errors.full_messages
    end
    render_flash
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_path
    else
      flash.now[:error] = 'Something went wrong'
      render_flash
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :public, :stack_id, :user_id, :filter)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
