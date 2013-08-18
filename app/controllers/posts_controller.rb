class PostsController < ApplicationController
  respond_to :html

  def index
    @post    = Post.new
    @comment = Comment.new
    @posts   = Post.newest_first
  end

  def create
    @post = Post.new post_params
    @post.user = User.current_user
    if @post.save
      WebsocketRails[:notifications].trigger 'new_post', @post
      redirect_to action: :index
    else
      @posts = Post.newest_first
      render :index
    end
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
