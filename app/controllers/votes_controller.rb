class VotesController < ApplicationController
  before_action :load_post_and_vote

  def up_vote
   update_vote!(1)
   redirect_to :back
 end

 def down_vote
   update_vote!(-1)
   redirect_to :back
 end

 def points
   up_vote - down_vote
 end
end

  private

  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first

  end

  def update_vote! (new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.build(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    # Extract vote updating/creating logic here.
   # This method has access to @vote, because of the before_action
  end
end
