class CommentsController < ApplicationController

  def create

    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    @comment.save

    redirect_to :back
  end

  def destroy

    @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        authorize @comment
        if @comment.destroy
          flash[:notice] = "Comment was flushed down the toilet."
        else
          flash[:error] = "Hahaha. Try again. Didn't work. NanaBooBoo."
        end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
