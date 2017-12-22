module ForumsHelper
  def forums_tree_for(forums)
    forums.map do |forum, nested_forums|
      render(forum) +
          (nested_forums.size > 0 ? content_tag(:div, forums_tree_for(nested_forums), class: "replies") : nil)
    end.join.html_safe
  end
end