# frozen_string_literal: true

module PostsHelper
  def created_at_date(post)
    post.created_at.strftime('%b %d, %Y')
  end
end
