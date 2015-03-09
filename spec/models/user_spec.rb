require 'rails_helper'

describe User do
  include TestFactories

  before do
    @user = authenticated_user
    @post = associated_post
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
end
