# frozen_string_literal: true

module Posts
  module Pagination
    extend ActiveSupport::Concern

    def set_paginated_posts
      @pagy, @posts = pagy(@posts)
    end
  end
end
