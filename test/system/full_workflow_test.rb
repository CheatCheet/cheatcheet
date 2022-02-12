# frozen_string_literal: true

require 'application_system_test_case'

class FullWorkflowTest < ApplicationSystemTestCase
  setup do
    log_as(:post_reader)
    # Bullet.unused_eager_loading_enable = false
  end

  teardown do
    # Bullet.unused_eager_loading_enable = true
  end

  test 'it executes a full workflow of a user visiting the app' do

  end
end
