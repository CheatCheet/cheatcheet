# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]

  def index
    @posts = Post.all
    @posts = @posts.from_user(params[:user_id]) if params[:user_id]
  end

  def show; end
  alias edit show

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :env, :user_id, :tags)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
