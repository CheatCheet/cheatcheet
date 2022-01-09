# frozen_string_literal: true

module PostsHelper
  def created_at_date(post)
    post.created_at.strftime('%b %d, %Y')
  end

  def stack_collection(post_stack_id)
    options = Stack.order(:name).pluck(:name, :id)
    options_for_select(options, post_stack_id || Stack.ruby_on_rails.id)
  end
end
