Rails.application.routes.draw do
# connect the comment to the post and a user
  get 'comments/create'

   devise_for :users

   resources :users, only: [:update]
   resources :topics do
     resources :posts, except: [:index] do
       resources :comments, only: [:create, :destroy]
     end
     resources :summaries
   end

   get 'about' => 'welcome#about'
   root to: 'welcome#index'
 end
