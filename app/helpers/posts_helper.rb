# frozen_string_literal: true

module PostsHelper
  def created_at_date(post)
    post.created_at.strftime('%b %d, %Y')
  end

  def body_markdown(post)
    extensions = { fenced_code_blocks: true, strikethrough: true, tables: true, autolink: true, safe_links_only: true }
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, link_attributes: { target: '_blank' })
    sanitize Redcarpet::Markdown.new(renderer, extensions).render(post.body),
             attributes: %w[href target]
  end
end
