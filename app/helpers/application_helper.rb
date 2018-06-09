module ApplicationHelper
  def link_fa_to(icon_name, link, html_options = {})
    link_to icon('fas', icon_name), link, html_options
  end
end
