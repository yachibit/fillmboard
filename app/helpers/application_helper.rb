module ApplicationHelper
  def prev_icon
    content_tag("i", nil, class: "icon-chevron-left")
  end

  def next_icon
    content_tag("i", nil, class: "icon-chevron-right")
  end
end