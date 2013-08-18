class CommentsController < ApplicationController
  respond_to :html

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = User.current_user

    if @comment.save
      respond_with @comment, location: @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
