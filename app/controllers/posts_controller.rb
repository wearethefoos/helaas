class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.newest_first
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def create
    @post = Post.create(post_params)
      WebsocketRails[:notifications].trigger 'new_post', @post
    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
