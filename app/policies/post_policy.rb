class PostPolicy < ApplicationPolicy
  def index?
   true
 end
 
 def new
  @post = Post.new
  authorize @post
end

 # Define a Pundit Scope sub-class in post_policy.rb to display different sets of
 # posts based on the role of the user. Admins and Moderators should see all posts,
 # members should only see their own posts, and guests should see no posts.

   class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve

      if user == nil
        return []
      end

      case user.role
      when "admin"
        scope.all
      when "moderator"
        scope.all
      else
        user.posts
        #scope allows members to see their own posts
      end
    end
  end

end
