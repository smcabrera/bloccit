class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Successfully added comment."
    else
      flash[:error] = "There was a problem saving your comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "There was a problem deleting this comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
