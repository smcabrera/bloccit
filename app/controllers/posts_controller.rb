class PostsController < ApplicationController
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    #todo: Need to go back through the More CRUD checkpoint and make sure that I've got this method squared away.
  end

end
