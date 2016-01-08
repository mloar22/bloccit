class Post < ActiveRecord::Base
  has_many :comments
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }
  has_one :summary

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  def render_as_markdown(markdown)
      renderer = Redcarpet::Render::HTML.new # this is setup for redcarpet
      extensions = {fenced_code_blocks: true} #i dont know
      redcarpet = Redcarpet::Markdown.new(renderer, extensions) #this is more setup
      return (redcarpet.render(markdown)).html_safe #this is where you pass your markdown text to the redcarpet renderer
  end

  def markdown_title
    render_as_markdown(self.title)
  end

  def markdown_body
    render_as_markdown(self.body)
  end
end
