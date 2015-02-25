require 'rails_helper'

describe PostsController do
  include TestFactories
  include Devise::TestHelpers

  before do
    request.env["HTTP_REFERER"] = '/'
    @user = authenticated_user
    @topic = associated_topic
    sign_in @user
    #@post = associated_post
  end

  describe '#create' do
    it 'Creates a new post' do
      expect {
        post( :create, topic_id: @topic )
      }
    end
  end
end
