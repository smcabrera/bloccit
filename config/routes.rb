Bloccit::Application.routes.draw do

  resources :posts, only: [:index]

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
        resources :comments, only: [:create, :destroy]
      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end

  devise_for :users
  resources :users, only: [:update, :show, :index]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end




