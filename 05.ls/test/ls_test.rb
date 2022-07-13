# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'

class ListTest < Minitest::Test
  def test_normal
    list = List.new(['*'], false)
    output = 'column_test.rb   ls_test.rb   '
    assert_equal output, list.show
  end

  def test_a
    list = List.new(['*', File::FNM_DOTMATCH], false)
    output = ".           column_test.rb   \n.DS_Store   ls_test.rb       "
    assert_equal output, list.show
  end

  def test_r
    list = List.new(['*'], true)
    output = 'ls_test.rb   column_test.rb   '
    assert_equal output, list.show
  end

  def test_ar
    list = List.new(['*', File::FNM_DOTMATCH], true)
    output = "ls_test.rb       .DS_Store   \ncolumn_test.rb   .           "
    assert_equal output, list.show
  end

  def test_l
    list = List.new(['*', File::FNM_DOTMATCH], true)
    output = <<~TEXT
    total 24
    -rw-r--r--  1 asahi.fuke  staff  394  7 12 23:20 ls.rb
    -rw-r--r--  1 asahi.fuke  staff  722  7 12 23:16 list.rb
    -rw-r--r--  1 asahi.fuke  staff  349  7 12 23:16 column.rb
    TEXT
    assert_equal output, list.show
  end
end
