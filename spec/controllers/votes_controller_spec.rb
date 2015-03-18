require 'rails_helper'

describe VotesController do

  include Devise::TestHelpers

  before do
    # This line is here because the controller action says to go "back" when it's done
    # but that would fail here. We don't care where it goes so we're just sending it to root.
    request.env["HTTP_REFERER"] = '/'
    @user = create(:user)
    @post = create(:post)
    sign_in @user
    @topic = create(:topic)
  end

  describe '#up_vote' do
    it 'Adds an up-vote to the post' do
      expect {
        post( :up_vote, topic_id: @topic.id, post_id: @post.id )
      }.to change{ @post.up_votes }.by 1
    end
  end

  describe '#down_vote' do
    it 'Adds a down-vote to the post' do
      expect {
        post( :down_vote, topic_id: @topic.id, post_id: @post.id )
      }.to change{ @post.down_votes }.by 1
    end
  end
end
