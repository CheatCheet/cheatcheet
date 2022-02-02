# frozen_string_literal: true

# REF: https://www.beflagrant.com/blog/pagination-with-hotwire
module Posts
  module Pagination
    extend ActiveSupport::Concern

    def set_paginated_posts
      @pagy, @posts = pagy(@posts, items: 25)
    end
  end
end
