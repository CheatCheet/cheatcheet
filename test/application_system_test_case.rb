# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome do |driver_options|
    driver_options.add_argument('disable-gpu')
    driver_options.add_argument('no-sandbox')
    driver_options.add_argument('disable-dev-shm-usage')
  end
end
