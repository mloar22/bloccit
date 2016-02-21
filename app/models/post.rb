class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :summary
  default_scope { order('rank DESC') }


   def up_votes
     votes.where(value: 1).count
   end

   def down_votes
     votes.where(value: -1).count
   end
   def points
     up_votes - down_votes
   end

   belongs_to :user
   belongs_to :topic

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   # validates :topic, presence: true
   # validates :user, presence: true
  def render_as_markdown(markdown)
      renderer = Redcarpet::Render::HTML.new # this is setup for redcarpet
      extensions = {fenced_code_blocks: true} #i dont know
      redcarpet = Redcarpet::Markdown.new(renderer, extensions) #this is more setup
      return (redcarpet.render(markdown)).html_safe #this is where you pass your markdown text to the redcarpet renderer
  end

  def markdown_title
    #ends up returning html
    render_as_markdown(self.title)
  end

  def markdown_body
    render_as_markdown(self.body)
  end


 def update_rank
   age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age_in_days

     update_attribute(:rank, new_rank)
   end

end
