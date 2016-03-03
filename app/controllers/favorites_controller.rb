class FavoritesController < ApplicationController
  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)

     if favorite.save
       # Add code to generate a success flash and redirect to post
      flash[:notice] = "This is a Favorite!"
      redirect_to [post.topic, post]
     else
       flash[:error] = "I know you like it but you didnt favorite it!"
       redirect_to [post.topic, post]
       # Add code to generate a failure flash and redirect to post
     end
   end

   def destroy
      post = Post.find(params[:post_id])
      favorite = current_user.favorites.build(post: post)
      if favorite.destroy
        flash[:notice] = "This no longer your favorite"
        redirect_to [post.topic, post]
      else
        flash[:error] = "there was a problem making this not your favorite."
        redirect_to [post.topic, post]
      end
   end

end
