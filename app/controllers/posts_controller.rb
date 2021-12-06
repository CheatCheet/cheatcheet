# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]
  before_action :owner?, only: %i[edit update destroy]

  def index
    @posts = Post.all
    @posts = @posts.from_user(params[:user_id]) if params[:user_id]
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
      flash.now[:error] = 'Something went wrong'
      render_flash
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:success] = 'Post was successfully updated'
    else
      flash.now[:error] = 'Something went wrong'
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
    params.require(:post).permit(:title, :body, :user_id, :tags)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def owner?
    redirect_to root_path if @post.user != current_user && !current_user.admin?
  end
end
