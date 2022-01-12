# frozen_string_literal: true

require 'test_helper'

class StackTest < ActiveSupport::TestCase
  test 'cannot have two stacks with same name' do
    stack = Stack.new(name: stacks(:ruby_on_rails).name)

    assert_equal stack.validate, false
    assert_includes stack.errors.full_messages, 'Name has already been taken'
  end

  test 'nullify post stack id if stack destroyed' do
    assert_changes 'Post.first.stack', nil do
      Post.first.stack.destroy
    end
  end
end
