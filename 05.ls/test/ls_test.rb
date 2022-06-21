# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'

class ListTest < Minitest::Test
  def test_normal
    list = List.new(['*'])
    output = 'column_test.rb   ls_test.rb   '
    assert_equal output, list.show
  end

  def test_a
    list = List.new(['*', File::FNM_DOTMATCH])
    output = ".           column_test.rb   \n.DS_Store   ls_test.rb       "
    assert_equal output, list.show
  end
end
