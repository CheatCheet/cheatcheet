# frozen_string_literal: true

module PostsHelper
  include Pagy::Frontend

  def build_posts_url(page:, params:)
    url_for(only_path: false, params: { page: page,
                                        stack: params[:stack],
                                        user_id: params[:user_id],
                                        search: params[:search] })
  end

  def created_at_date(post)
    post.created_at.strftime('%b %d, %Y')
  end

  def stack_collection(stack_id)
    options = Stack.order(:name).pluck(:name, :id)
    options_for_select(options, stack_id || Stack.default.id)
  end
end
