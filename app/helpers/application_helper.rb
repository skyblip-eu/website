module ApplicationHelper
  def render_erb(content)
    render inline: content, layout: false
  end
end
