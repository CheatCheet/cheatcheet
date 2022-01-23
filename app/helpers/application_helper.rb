# frozen_string_literal: true

module ApplicationHelper
  ALLOWED_PATHS = %w[
    posts/index
  ].freeze

  def infinite_scroll_in_current_page?
    ALLOWED_PATHS.include?(request.path_parameters.values.join('/'))
  end
end
