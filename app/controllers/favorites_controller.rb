class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    #favorite = Favorite.new(:user_id  => current_user, :post_id => @post.id)
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Favorited post"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting this post. Please try again"
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    # Find the current user's favorite with the ID in the params
    favorite = current_user.favorites.find_by_post_id(@post.id)
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Unfavorited post"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unfavorited post"
      redirect_to [@post.topic, @post]
    end
  end
end
