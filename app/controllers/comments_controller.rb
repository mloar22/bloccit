class CommentsController < ApplicationController
  def create
# we used binding.pry to get the details of this code,
# Pry is a gem that does open heart surgery on the code in the moment
#that it runs so we can see all attributes and details

    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    @comment.save
     
    redirect_to :back
  end
end
