class CommentsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: @post.id)

    if @comment.save
      flash[:notice] = "Successfully added comment"
    else
      flash[:error] = "There was a problem saving your comment. Please try again."
    end
  end
end
