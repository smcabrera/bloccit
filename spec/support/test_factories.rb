module TestFactories
  def associated_post(options={})
    post_options = {
      :title => 'Post title',
      :body  => 'Post bodies must be pretty long.',
      :topic => Topic.create(name: 'Topic name'),
      :user  => authenticated_user
    }.merge(options)
    Post.create(post_options)
  end

  def associated_comment(options={})
    comment_options = { body: "A comment" }.merge(options)
    comment = Comment.new(comment_options)
    allow(comment).to receive(:send_favorite_emails)
    comment.save
    comment
  end

  def associated_topic(options={})
    topic_options = {
      name: "A topic",
      public: true,
      description: 'Topic text',
    }.merge(options)
    Topic.create(topic_options)
  end

  def authenticated_user(options={})
    user_options = {
      :email => "email#{rand}@fake.com",
      :password => 'password'
    }.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end
end
