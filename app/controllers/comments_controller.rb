class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id

    if @comment.save
      flash[:notice] = "Successfully added comment."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem saving your comment. Please try again."
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
