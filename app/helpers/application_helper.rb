module ApplicationHelper
  def form_group_tag(errors, &block)
       if errors.any?
         content_tag :div, capture(&block), class: 'form-group has-error'
       else
         content_tag :div, capture(&block), class: 'form-group'
       end
     end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new # this is setup for redcarpet
    extensions = {fenced_code_blocks: true} #i dont know
    redcarpet = Redcarpet::Markdown.new(renderer, extensions) #this is more setup
    (redcarpet.render(markdown)).html_safe #this is where you pass your markdown text to the redcarpet renderer
  end


def markdown_body
  renderer = Redcarpet::Render::HTML.new
  extensions = {fenced_code_blocks: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render markdown).html_safe
end

end
