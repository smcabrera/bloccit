require 'rails_helper'

describe User do

  before do
    @user = create(:user)
    @post = create(:post)
  end

  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be(nil)
    end

    it "returns the appropriate favorite if it exists" do
      fave = Favorite.create(:user_id => @user.id, :post_id => @post.id)
      expect( @user.favorited(@post) ).to eq(fave)
    end
  end

  describe ".top-rated" do
    before do
      @user1 = create(:user_with_post_and_comment)
      @user2 = create(:user_with_post_and_comment)
      create(:comment, user: @user2)
    end

    it "returns user ordered by comments and posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a `post_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end
