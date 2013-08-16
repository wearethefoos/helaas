class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.newest_first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
      WebsocketRails[:notifications].trigger 'new_post', @post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
