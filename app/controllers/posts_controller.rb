class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def create
    @post = Post.new(post_params)
    respond_with @post
  end

  def show
    @post = Post.find(:id)
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
