module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def md(content)
    MdPreview::CustomParser.parse(content)
  end

  def active_nav(nav_link)
    'active' if nav_link == @current_section
  end

  def body_css
    [controller_name, action_name].join('-')
  end
end
