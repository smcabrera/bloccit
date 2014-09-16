require 'rails_helper'

feature 'User creates a comments' do
  scenario 'successfully' do
    @post = Post.first
    visit @post
  end
end


