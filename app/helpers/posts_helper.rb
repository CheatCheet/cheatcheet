# frozen_string_literal: true

module PostsHelper
  def created_at_date(post)
    post.created_at.strftime('%b %d, %Y')
  end

  def body_markdown(post)
    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks]
    sanitize Markdown.new(post.body, *options).to_html
  end
end
