Rails.application.routes.draw do
# connect the comment to the post and a user
  get 'comments/create'

   devise_for :users
   resources :users, only: [:update, :show]

   resources :topics do
     resources :posts, except: [:index] do
       resources :comments, only: [:create, :destroy]
       resources :favorites, only: [:create, :destroy]

       post '/up-vote' => 'votes#up_vote', as: :up_vote
       post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
     resources :summaries
   end

   resources :posts, only: [] do
     resources :favorites, only: [:create, :destroy]
   end

   get 'about' => 'welcome#about'
   root to: 'welcome#index'
 end
