class CommentsController < ApplicationController
  respond_to :html

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_with @comment, location: @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
